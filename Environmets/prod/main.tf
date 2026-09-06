module "infra_vm" {
  source              = "../../CICD_Modules/infra"
  vm_name             = "prod-vm1"
  resource_group_name = "rg-prod-infra"
  location            = var.location
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  ssh_public_key      = var.ssh_public_key
  subnet_id           = var.subnet_id
}
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccountmangala01"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}
