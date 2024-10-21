terraform {
  backend "s3" {
    bucket         = "s3cloudhub-s3-demo-xyz" # change this
    key            = "s3cloudhub/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
