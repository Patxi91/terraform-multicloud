# Conditional Expressions in Terraform

## Overview

Conditional expressions allow you to define values based on certain conditions in your Terraform configuration.

## Syntax

The syntax for a conditional expression is:

```hcl
condition ? true_value : false_value
```

## Example

```hcl
variable "environment" {
  description = "The environment to deploy to"
  default     = "production"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.environment == "production" ? "t2.large" : "t2.micro"
}
```

## Conclusion

Conditional expressions enhance the dynamic capabilities of your Terraform configurations by allowing for different resource configurations based on conditions.



[Previous: Tfvars](07-tfvars.md) | [Next: Built In Function](09-builtin-functions.md) | [Back to README](README.md)
