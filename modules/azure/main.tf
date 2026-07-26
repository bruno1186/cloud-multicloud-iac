# Modulo Azure - provisionamento padronizado
# Provider: Azure (azurerm)

variable "location" {
  description = "Regiao Azure de destino"
  type        = string
  default     = "brazilsouth"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Nome do resource group"
  type        = string
}

variable "storage_account_name" {
  description = "Nome da storage account (deve ser globalmente unico, minusculo)"
  type        = string
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location

  tags = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "cloud-multicloud-iac"
  }
}

resource "azurerm_storage_account" "app_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

output "storage_account_id" {
  value = azurerm_storage_account.app_storage.id
}
