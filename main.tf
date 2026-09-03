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

# Virtual Network
resource "azurerm_virtual_network" "prasad_vnet" {
  name                = "prasad-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.prasad.location
  resource_group_name = azurerm_resource_group.prasad.name
}

# Subnet 1
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.prasad.name
  virtual_network_name = azurerm_virtual_network.prasad_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Subnet 2
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.prasad.name
  virtual_network_name = azurerm_virtual_network.prasad_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Subnet 3
resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name  = azurerm_resource_group.prasad.name
  virtual_network_name = azurerm_virtual_network.prasad_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

# Subnet 4
resource "azurerm_subnet" "subnet4" {
  name                 = "subnet4"
  resource_group_name  = azurerm_resource_group.prasad.name
  virtual_network_name = azurerm_virtual_network.prasad_vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}