# Resource Group
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "teaf4"
}

# Location
variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

# Container Registry name (must be globally unique)
variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
  default     = "teafcon"
}

# ACR SKU: Basic, Standard, Premium
variable "acr_sku" {
  description = "SKU for ACR"
  type        = string
  default     = "Basic"
}
