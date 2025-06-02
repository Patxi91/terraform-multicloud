# Terraform Variable Files (.tfvars)

## Overview

Variable files (with the .tfvars extension) allow you to define variable values separately from your main configuration.

## Example .tfvars File

Create a file named `terraform.tfvars`:

```hcl
region        = "eu-north-1"
instance_type = "t3.micro"
```

## Using .tfvars Files

When you run Terraform commands, it automatically loads the variables defined in the `.tfvars` file. You can also specify it explicitly:

```bash
terraform apply -var-file="custom.tfvars"
```

## Conclusion

Using .tfvars files helps keep your configurations clean and allows for different variable sets for different environments.


[Previous: Variables Implementation](06-variables-implementation.md) | [Next: Conditional Expression](08-conditional-expressions.md) | [Back to README](README.md)
