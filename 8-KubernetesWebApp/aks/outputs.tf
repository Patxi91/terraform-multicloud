output "resource_group_name" {
  value = azurerm_resource_group.aks_terraform_rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}
