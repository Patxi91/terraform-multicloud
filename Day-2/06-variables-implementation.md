# Variables Implementation in Terraform

## Overview

This document demonstrates how to implement variables within a Terraform configuration, showcasing their usage for resource definitions.

## Example Configuration

```hcl
variable "region" {
  description = "The AWS region to deploy in"  # Description of the variable
  default     = "us-east-1"                    # Default region
}

variable "instance_type" {
  description = "AWS instance type"             # Description of the variable
  default     = "t2.micro"                       # Default instance type
}

provider "aws" {
  region = var.region                             # Use variable for provider region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"       # Specify the AMI
  instance_type = var.instance_type              # Use variable for instance type
}
```

[Previous: Required Providers](05-variables.md) | [Next: Tfvars](07-tfvars.md) | [Back to README](README.md)



