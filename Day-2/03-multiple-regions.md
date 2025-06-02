# Working with Multiple Regions

## Overview

In Terraform, you can manage resources in multiple regions of a single provider. This is especially relevant for cloud providers like AWS or Azure.

## Defining Resources in Different Regions

To create resources in different regions, define multiple provider configurations with different aliases. Here's an example with AWS:

```hcl
provider "aws" {
  region = "eu-north-1"
  alias  = "north_eu"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "west_eu"
}

resource "aws_instance" "north_instance" {
  provider      = aws.north_eu
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
}

resource "aws_instance" "west_europe_instance" {
  provider      = aws.west_eu
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
}
```

## Conclusion

Using multiple regions in your Terraform configuration allows for better resource distribution and redundancy.



[Previous: Multiple Providers](02-multiple-providers.md) | [Next: Required Providers](04-required-providers.md) | [Back to README](README.md)
