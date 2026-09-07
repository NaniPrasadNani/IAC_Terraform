terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccountmangala01"
    container_name       = "tfstate"
    key                  = "preprod.tfstate"
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "preprod_rg" {
  name     = "rg-preprod-infra"
  location = var.location
}
variable "vm_size" {
  description = "The size of the VM to deploy"
  type        = string
}

resource "azurerm_virtual_network" "preprod_vnet" {
  name                = "preprod-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.preprod_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "preprod_subnet" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.preprod_rg.name
  virtual_network_name = azurerm_virtual_network.preprod_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


module "infra_vm" {
  source              = "../../CICD_Modules/infra"
  vm_name             = "preprod-vm1"
  resource_group_name = azurerm_resource_group.preprod_rg.name
  location            = var.location
  vm_size             = var.vm_size
  admin_username      = "azureuser"
  ssh_public_key      = var.ssh_public_key
  subnet_id           = var.subnet_id
}

