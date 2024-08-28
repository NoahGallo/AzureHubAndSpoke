resource "azurerm_resource_group" "HubAndSpokeTF" {
    name = var.resource_group_name
    location = var.resource_group_location
}

module "spokenetwork1" {
    source = "./modules/spoke"
    name = "spoke1"
    resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
    location = "eastus"
    address_space = "20.0.0.0/16"
    subnet_name = "spoke1subnet1"
    subnet_address_prefix = "20.0.0.0/24"
    }

module "spokenetwork2" {
    source = "./modules/spoke"
    name = "spoke2"
    resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
    location = "germanywestcentral"
    address_space = "21.0.0.0/16"
    subnet_name = "spoke2subnet1"
    subnet_address_prefix = "21.0.0.0/24"
    }

module "spokenetwork3" {
    source = "./modules/spoke"
    name = "spoke3"
    resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
    location = "westus"
    address_space = "22.0.0.0/16"
    subnet_name = "spoke3subnet1"
    subnet_address_prefix = "22.0.0.0/24"
    }

module "spokenetwork4" {
    source = "./modules/spoke"
    name = "spoke4"
    resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
    location = "northeurope"
    address_space = "23.0.0.0/16"
    subnet_name = "spoke4subnet1"
    subnet_address_prefix = "23.0.0.0/24"
    }


