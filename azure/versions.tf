provider "azurerm" {
  # Configuration options
  version = "=2.36.0"
  subscription_id = var.subscription_id
  features {}
}