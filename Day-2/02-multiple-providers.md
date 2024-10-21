# Using Multiple Providers

## Overview

Terraform allows you to configure multiple providers in a single configuration. This is useful when you need to manage resources across different platforms.

## Defining Multiple Providers

You can define multiple providers by specifying them with different configurations. For example:

```hcl
provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  features {}
}
```

## Accessing Resources from Multiple Providers

To use resources from multiple providers, you can reference them in your configuration. Here's an example of creating an AWS EC2 instance and an Azure Virtual Machine:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

resource "azurerm_virtual_machine" "example" {
  name                  = "example-vm"
  location              = "West US"
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
}
```

## Conclusion

Managing multiple providers allows for more complex and flexible infrastructure setups.




[Previous: Providers](01-providers.md) | [Next: Multiple Regions](03-multiple-regions.md) | [Back to README](README.md)
