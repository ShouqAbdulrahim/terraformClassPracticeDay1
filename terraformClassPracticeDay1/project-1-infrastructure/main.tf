terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Reference existing Resource Group
data "azurerm_resource_group" "existing" {
  name =   var.resource_group_name  # your existing RG name
}

# Reference existing Azure Container Registry
data "azurerm_container_registry" "existing" {
  name                =  var.acr_name                 # your existing ACR name
  resource_group_name = data.azurerm_resource_group.existing.name
}

resource "azurerm_container_group" "webapp" {
  name                = var.app_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name

  ip_address_type = "Public"
  os_type         = "Linux"

  identity {
    type = "SystemAssigned"
  }

  # بيانات دخول ACR (لو مفعّل admin على الـACR)
  image_registry_credential {
    server   = data.azurerm_container_registry.existing.login_server
    username = var.acr_username
    password = var.acr_password
  }

  # الكنتينر نفسه
  container {
    name   = "frontend"  # سمّي اللي يناسبك
    image  = "${data.azurerm_container_registry.existing.login_server}/myimage:latest"
    cpu    = "0.5"
    memory = "1.0"

    ports {
      port     = 80
      protocol = "TCP"
    }

    # مثال متغيرات بيئة (اختياري)
    environment_variables = {
      NODE_ENV = "production"
    }
  }
}


