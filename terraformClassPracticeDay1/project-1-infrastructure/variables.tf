# This file defines the settings you can change

variable "resource_group_name" {
  description = "Existing resource group name"
  type        = string
  default     = "devops-rg-shouq"   
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "acr_name" {
  description = "Existing ACR name"
  type        = string
}

variable "app_name" {
  description = "Container app/group name"
  type        = string
  default     = "webapp"
}

# لو مستخدمة ACR admin (أسهل حالياً)
variable "acr_username" {
  description = "ACR admin username"
  type        = string
}

variable "acr_password" {
  description = "ACR admin password"
  type        = string
  sensitive   = true
}
