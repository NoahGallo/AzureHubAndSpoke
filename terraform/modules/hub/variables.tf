variable "name" {
    type = string
    description = "Name of the spoke virtual network"
}

variable "resource_group_name" {
    type = string
    description = "RG of the spoke network"
}

variable "location" {
    type = string
    description = "Location of the spoke virtual network"
}

variable "address_space" {
    type = string
    description = "address space of the spoke"
}

variable "subnet_name" {
    type = string
    description = "name of the subnet"
}

variable "subnet_address_prefix" {
    type = string
    description = "address space of the subnet"
}