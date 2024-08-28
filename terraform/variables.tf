variable "arm_subscription_id" {
    type = string
    description = "The subscription ID for Azure"
}

variable "arm_client_id" {
    type = string
    description = "The client ID for the Service Principal"
}

variable "arm_client_secret" {
    type = string
    description = "The client secret for the Service Principal"
    sensitive = true
}

variable "arm_tenant_id" {
    type = string
    description = "The tenant ID for Azure"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "resource_group_location" {
    type = string
    description = "Location of the resource group"
}