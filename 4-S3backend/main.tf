provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "example" {
  instance_type = "t3.micro"
  ami           = "ami-0c1ac8a41498c1a9c" # change this
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "mys3-demo-20250602" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
