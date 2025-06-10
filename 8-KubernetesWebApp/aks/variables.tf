variable "resource_group_name" {
  description = "The name of the Azure Resource Group to create."
  type        = string
  default     = "aks-terraform-rg"
}

variable "location" {
  description = "The Azure region where the resources will be deployed (e.g., 'Switzerland North' or 'northeurope')."
  type        = string
  default     = "northeurope"
}

variable "aks_cluster_name" {
  description = "The name of the Azure Kubernetes Cluster (AKS)."
  type        = string
  default     = "my-aks-cluster"
}

variable "aks_dns_prefix" {
  description = "The DNS prefix for the AKS cluster. Must be unique within the Azure region."
  type        = string
  default     = "my-aks-dns"
}

variable "node_count" {
  description = "The number of nodes in the default node pool. Set to 1 for the smallest configuration."
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the Virtual Machine for the AKS nodes. 'Standard_B1s' is one of the smallest and cheapest available."
  type        = string
  default     = "Standard_B2s"
}

variable "os_disk_size_gb" {
  description = "The OS Disk size in GB for the AKS nodes. 30GB is typically the minimum required for AKS."
  type        = number
  default     = 30 # Minimum recommended OS disk size for AKS
}

variable "environment_tag" {
  description = "Environment tag (e.g., 'Dev', 'Prod', 'Demo')."
  type        = string
  default     = "Demo"
}
