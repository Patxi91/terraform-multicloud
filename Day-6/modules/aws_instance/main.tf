provider "aws" {
  region = "eu-north-1"
}

variable "ami" {
  description = "This is AMI for the instance"
}

variable "instance_type" {
  description = "This is the instance type, for example: t3.micro"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
