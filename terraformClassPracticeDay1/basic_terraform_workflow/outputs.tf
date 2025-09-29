# Resource group name
output "resource_group" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg.name
}

# The login server URL for the ACR (e.g., devopsacrshouq.azurecr.io)
output "acr_login_server" {
  description = "The login server URL for the ACR"
  value       = azurerm_container_registry.acrok.login_server
}

# ACR admin username
output "acr_admin_username" {
  description = "Admin username for the ACR"
  value       = azurerm_container_registry.acrok.admin_username
}

# ACR admin password (sensitive)
output "acr_admin_password" {
  description = "Admin password for the ACR"
  value       = azurerm_container_registry.acrok.admin_password
  sensitive   = true
}
