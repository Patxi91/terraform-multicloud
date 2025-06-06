# Variables in Terraform

## Overview

Variables allow you to parameterize your Terraform configurations, making them more dynamic and reusable.

## Defining Variables

You can define variables using the `variable` block:

```hcl
variable "instance_type" {
  description = "Type of instance to create"
  default     = "t3.micro"
}
```

## Using Variables

You can reference variables in your resources:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
}
```

## Conclusion

Variables enhance the flexibility and maintainability of Terraform configurations.


[Previous: Required Providers](04-required-providers.md) | [Next: Variables Implementation](06-variables-implementation.md) | [Back to README](README.md)
