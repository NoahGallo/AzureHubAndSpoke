variable "peering_name" {
  description = "The name of the VNet peering"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the VNet is located"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network where the peering will be created"
  type        = string
}

variable "remote_vnet_id" {
  description = "The resource ID of the remote virtual network to peer with"
  type        = string
}

variable "allow_forwarded_traffic" {
  description = "Allow forwarded traffic across the peering"
  type        = bool
  default     = true
}

variable "allow_gateway_transit" {
  description = "Allow gateway transit across the peering"
  type        = bool
  default     = false
}

variable "use_remote_gateways" {
  description = "Use the remote virtual network's gateway"
  type        = bool
  default     = false
}
