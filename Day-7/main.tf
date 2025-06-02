provider "aws" {
  region = "eu-north-1"
}

provider "vault" {
  address          = "http://13.53.176.239:8200/" // Replace with your Vault server address
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "a855de35-f494-9eb3-f20d-bfcebb0add25"
      secret_id = "d019a2e2-af0e-8e89-598c-92436af446e2"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"      // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name   = "test"
    Secret = data.vault_kv_secret_v2.example.data["foo"]
  }
}
