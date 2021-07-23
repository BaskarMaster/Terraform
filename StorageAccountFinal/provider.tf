provider "azurerm" {
  subscription_id = var.subscription
  tenant_id       = var.tenant
  features {}
}