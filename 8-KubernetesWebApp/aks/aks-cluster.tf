provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# AKS Resource Group
resource "azurerm_resource_group" "aks_terraform_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment_tag
  }
}

# Azure Kubernetes Service (AKS) Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_terraform_rg.location
  resource_group_name = azurerm_resource_group.aks_terraform_rg.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name            = "systempool"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
  }

  identity {
    type = "SystemAssigned" # Managed Identity for AKS
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = var.environment_tag
  }
}