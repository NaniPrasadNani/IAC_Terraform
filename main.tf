terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccountmangala01"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "prasad" {
  name     = "prasad"
  location = "West Europe"
}

resource "azurerm_resource_group" "prasad1" {
  name     = "prasad1"
  location = "West Europe"
}
