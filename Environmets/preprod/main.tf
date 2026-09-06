module "infra_vm" {
  source              = "../../modules/infra-vm"
  vm_name             = "preprod-vm1"
  resource_group_name = "rg-preprod-infra"
  location            = var.location
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  ssh_public_key      = var.ssh_public_key
  subnet_id           = var.subnet_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"                 # your RG name
    storage_account_name = "tfstateaccountmangala01"    # your storage account
    container_name       = "tfstate"                    # container you created
    key                  = "preprod.tfstate"            # unique state file name
  }
}

