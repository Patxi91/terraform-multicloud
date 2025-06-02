provider "aws" {
  region = "eu-north-1"
}

provider "vault" {
  address          = "http://13.53.176.239:8200/" // Replace with your Vault server address
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      # Updated with the role_id you fetched
      role_id   = "a855de35-f494-9eb3-f20d-bfcebb0add25"
      # Updated with the NEW secret_id you just generated
      secret_id = "552825fe-c78c-d8fe-b22c-8ff681a707dd"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"          // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c1ac8a41498c1a9c"
  instance_type = "t3.micro"

  tags = {
    Name   = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
