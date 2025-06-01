provider "aws" {
  region = "eu-north-1" # Specify your AWS region
}


data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


# Launch an EC2 instance
resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t3.micro"

  tags = {
    Name = "Basic-EC2-Instance"
  }
}
