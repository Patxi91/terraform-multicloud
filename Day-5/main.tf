# Define the AWS provider configuration.
provider "aws" {
  region = "eu-north-1"  # Replace with your desired AWS region.
}

variable "cidr" {
  default = "10.0.0.0/16"
}

resource "aws_key_pair" "example" {
  key_name   = "terraform-demo-20250602"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file, then "ssh-keygen -t rsa"
}  # Then: ssh -i ~/.ssh/id_rsa.pub ubuntu@EC2_PUBLIC_IP

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true
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

  # IMPORTANT: The file and remote-exec provisioners are REMOVED from here.
  # They are moved to the null_resource below for application deployment.
}

resource "null_resource" "app_deployer" {

  depends_on = [aws_instance.server]

  # Triggers block for redeployment.
  triggers = {
    app_py_checksum = filemd5("app.py")
  }

  # Connection block for the null_resource, connecting to the EC2 instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa") # Ensure this path is correct for your local machine
    host        = aws_instance.server.public_ip
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

      "if [ ! -d \"app_venv\" ]; then python3 -m venv app_venv; fi",

      "/home/ubuntu/app_venv/bin/pip install flask",

      "chmod +x app.py",

      "sudo pkill -f \"python3.*app.py\" || true",

      # setsid to run the command in a new session, fully detached for processes that need to persist after SSH.
      "sudo setsid /home/ubuntu/app_venv/bin/python3 /home/ubuntu/app.py > /dev/null 2>&1 < /dev/null &",
      "echo 'Flask app deployed and started successfully on port 80.'"
    ]
  }
}
