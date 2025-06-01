# az ad sp create-for-rbac --name "test-azure" --role "Contributor" --scopes "/subscriptions/8ea744ab-d4a6-4d89-abf6-b53cce59add7"

provider "azurerm" {
  subscription_id = "8ea744ab-d4a6-4d89-abf6-b53cce59add7"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
/*
terraform {
  backend "azurerm" {
    resource_group_name  = "tf-stage-azure-open-ai"
    storage_account_name = "terraformstateopen2024ai"
    container_name       = "terraformopenai2024"
    key                  = "terraform.tfstate"
  }
}*/
resource "azurerm_resource_group" "example" {
  name     = "example-resources5"
  location = "West Europe"
}
resource "azurerm_virtual_network" "example" {
  name                = "example-network3"
  address_space       = ["10.0.0.0/16"]
  location            = "West Europe"
  resource_group_name = "example-resources5"
}
resource "azurerm_subnet" "example" {
  name                 = "example-subnet3"
  resource_group_name  = "example-resources5"
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_network_interface" "example" {
  name                = "example-nic3"
  location            = "West Europe"
  resource_group_name = "example-resources5"
  ip_configuration {
    name                          = "internal2"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_virtual_machine" "example" {
  name                  = "test"
  location              = "West Europe"
  resource_group_name   = "example-resources5"
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_B1s"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "example-machine"
    admin_username = "adminuser"
    admin_password = "AdminPassword123!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "testing"
  }
}
