# Working with Multiple Regions

## Overview

In Terraform, you can manage resources in multiple regions of a single provider. This is especially relevant for cloud providers like AWS or Azure.

## Defining Resources in Different Regions

To create resources in different regions, define multiple provider configurations with different aliases. Here's an example with AWS:

```hcl
provider "aws" {
  region = "us-east-1"
  alias  = "east"
}

provider "aws" {
  region = "us-west-2"
  alias  = "west"
}

resource "aws_instance" "east_instance" {
  provider      = aws.east
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

resource "aws_instance" "west_instance" {
  provider      = aws.west
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

## Conclusion

Using multiple regions in your Terraform configuration allows for better resource distribution and redundancy.

