provider "aws" {
  region = "eu-north-1"
}

variable "ami" {
  description = "value"
}

variable "instance_type" {
  description = "value"
  type        = map(string)

  default = {
    "dev"   = "t3.micro"
    "stage" = "t3.medium"
    "prod"  = "t3.xlarge"
  }
}

module "aws_instance" {
  source        = "./modules/aws_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t3.micro")
}
