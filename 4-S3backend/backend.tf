/*
terraform {
  backend "s3" {
    bucket         = "mys3-demo-20250602" # change this
    key            = "tfstate/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
*/