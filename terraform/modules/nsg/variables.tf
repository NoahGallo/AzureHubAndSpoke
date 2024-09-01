variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
}

variable "location" {
  description = "The location where the NSG will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the NSG will be created"
  type        = string
}

variable "port" {
  description = "The port number to allow in the NSG rule"
  type        = string
}

variable "priority" {
  description = "The priority of the NSG rule"
  type        = number
  default     = 1000
}

variable "source_address_prefix" {
  description = "The source address prefix for the NSG rule"
  type        = string
  default     = "*"
}

variable "destination_address_prefix" {
  description = "The destination address prefix for the NSG rule"
  type        = string
  default     = "*"
}

variable "subnet_id" {
  description = "The ID of the subnet to associate the NSG with (optional)"
  type        = string
  default     = ""
}

variable "network_interface_id" {
  description = "The ID of the network interface to associate the NSG with (optional)"
  type        = string
  default     = ""
}
