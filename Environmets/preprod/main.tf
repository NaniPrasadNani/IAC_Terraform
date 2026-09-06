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

