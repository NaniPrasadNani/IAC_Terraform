variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key for VM login"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where VM will be deployed"
  type        = string
}

