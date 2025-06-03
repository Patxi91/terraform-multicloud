# Define the AWS provider configuration.
provider "aws" {
  region = "eu-north-1" # Replace with your desired AWS region.
}

variable "cidr" {
  default = "10.0.0.0/16"
}

resource "aws_key_pair" "example" {
  key_name   = "terraform-demo-20250602" # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub") # Replace with the path to your public key file, then "ssh-keygen -t rsa"
}                                        # Then: ssh -i ~/.ssh/id_rsa.pub ubuntu@EC2_PUBLIC_IP

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true # Keep this as the EIP will associate afterwards
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "websg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-0c1ac8a41498c1a9c"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.websg.id]
  subnet_id              = aws_subnet.sub1.id

  # The connection block is still needed here for Terraform to manage the instance lifecycle
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa") # Make sure this path is correct on your local machine
    host        = self.public_ip
  }
}

resource "null_resource" "app_deployer" {

  # Add the EIP association to depends_on to ensure it's complete before connecting
  depends_on = [
    aws_instance.server,
    aws_eip_association.flask_app_eip_assoc
  ]

  # Triggers block for redeployment.
  triggers = {
    app_py_checksum = filemd5("app.py")  # app changes
    server_id       = aws_instance.server.id    # server changes - This will trigger on replacement
  }

  # Connect null_resource to the EC2 instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa") # Ensure this path is correct for your local machine
    host        = aws_eip.flask_app_eip.public_ip  # Use the Elastic IP for a stable connection
  }

  # File provisioner to copy app.py from local to the remote EC2 instance
  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  # Remote-exec provisioner to install dependencies and start/restart the app
  provisioner "remote-exec" {
    inline = [
      "echo 'Starting application deployment...'",
      "sudo apt update -y",
      "sudo apt-get install -y python3-venv",
      "cd /home/ubuntu",

      # Create the virtual environment named 'app_venv' if it doesn't exist.
      "if [ ! -d \"app_venv\" ]; then python3 -m venv app_venv; fi",

      # Ensure pip is up-to-date within the virtual environment first.
      "/home/ubuntu/app_venv/bin/pip install --upgrade pip",

      # Install Flask into the virtual environment using its specific pip.
      "/home/ubuntu/app_venv/bin/pip install flask",

      # Ensure app.py has execute permissions (good practice for scripts)
      "chmod +x app.py",

      # Kill any existing app.py processes before starting a new one.
      "sudo pkill -f \"python3.*app.py\" || true",

      # setsid to run the command in a new session, fully detached for processes that need to persist after SSH.
      "sudo setsid /home/ubuntu/app_venv/bin/python3 /home/ubuntu/app.py > /dev/null 2>&1 < /dev/null &",
      "sleep 2", # Add a short delay to allow the background process to fully detach
      "echo 'Flask app deployed and started successfully on port 80.'"
    ]
  }
}

# Elastic IP for a stable public IP
resource "aws_eip" "flask_app_eip" {
  vpc = true
  tags = {
    Name = "FlaskAppEIP"
  }
}

# Associate Elastic IP with the EC2 instance
resource "aws_eip_association" "flask_app_eip_assoc" {
  instance_id   = aws_instance.server.id
  allocation_id = aws_eip.flask_app_eip.id
}

# Output the Elastic IP
output "flask_app_elastic_ip" {
  description = "The Elastic IP address assigned to the Flask application server."
  value       = aws_eip.flask_app_eip.public_ip
}
