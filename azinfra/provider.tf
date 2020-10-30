terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  version = "~>2.27.0"
  features {}
}

# Make client_id, tenant_id, subscription_id and object_id variables
data "azurerm_client_config" "current" {}
