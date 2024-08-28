terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.116.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "HubAndSpokeTFState"
    storage_account_name  = "noahhubandspokesa"    # Must be globally unique
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}  # Required for the AzureRM provider but can be left empty
  subscription_id = var.arm_subscription_id
  client_id       = var.arm_client_id
  client_secret   = var.arm_client_secret
  tenant_id       = var.arm_tenant_id
}