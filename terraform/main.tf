resource "azurerm_resource_group" "HubAndSpokeTF" {
    name = var.resource_group_name
    location = var.resource_group_location
}

module "hubnetwork" {
    source = "./modules/hub"
    name = "hubnetwork"
    resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
    location = var.resource_group_location
    address_space = "10.0.0.0/16"
    subnet_name = "hubsubnet"
    subnet_address_prefix = "10.0.0.0/24"
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

module "peering_hub_to_spoke1" {
  source = "./modules/peering"
  peering_name = "hubtospoke1"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "hubnetwork"
  remote_vnet_id = module.spokenetwork1.vnet_id
}

module "peering_hub_to_spoke2" {
  source = "./modules/peering"
  peering_name = "hubtospoke2"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "hubnetwork"
  remote_vnet_id = module.spokenetwork2.vnet_id
}

module "peering_hub_to_spoke3" {
  source = "./modules/peering"
  peering_name = "hubtospoke3"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "hubnetwork"
  remote_vnet_id = module.spokenetwork3.vnet_id
}

module "peering_hub_to_spoke4" {
  source = "./modules/peering"
  peering_name = "hubtospoke4"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "hubnetwork"
  remote_vnet_id = module.spokenetwork4.vnet_id
}

module "peering_spoke1_to_hub" {
  source = "./modules/peering"
  peering_name = "spoke1tohub"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "spoke1"
  remote_vnet_id = module.hubnetwork.hub_vnet_id
}

module "peering_spoke2_to_hub" {
  source = "./modules/peering"
  peering_name = "spoke2tohub"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "spoke2"
  remote_vnet_id = module.hubnetwork.hub_vnet_id
}

module "peering_spoke3_to_hub" {
  source = "./modules/peering"
  peering_name = "spoke3tohub"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "spoke3"
  remote_vnet_id = module.hubnetwork.hub_vnet_id
}

module "peering_spoke4_to_hub" {
  source = "./modules/peering"
  peering_name = "spoke4tohub"
  resource_group_name = azurerm_resource_group.HubAndSpokeTF.name
  vnet_name = "spoke4"
  remote_vnet_id = module.hubnetwork.hub_vnet_id
}

module "windows_vm_spoke1" {
  source               = "./modules/windows-vm"
  vm_name              = "spoke1-vm"
  resource_group_name  = azurerm_resource_group.HubAndSpokeTF.name
  location             = module.spokenetwork1.location
  subnet_id            = module.spokenetwork1.subnet_id
  vm_size              = "Standard_DS1_v2"
  admin_username       = "azureuser"
  admin_password       = "P@ssw0rd1234"
}

module "windows_vm_spoke2" {
  source               = "./modules/windows-vm"
  vm_name              = "spoke2-vm"
  resource_group_name  = azurerm_resource_group.HubAndSpokeTF.name
  location             = module.spokenetwork2.location
  subnet_id            = module.spokenetwork2.subnet_id
  vm_size              = "Standard_DS1_v2"
  admin_username       = "azureuser"
  admin_password       = "P@ssw0rd1234"
}

# Adding a Linux VM to spokenetwork1
module "linux_vm_spoke3" {
  source               = "./modules/linux-vm"
  vm_name              = "spoke3-vm"
  resource_group_name  = azurerm_resource_group.HubAndSpokeTF.name
  location             = module.spokenetwork3.location
  subnet_id            = module.spokenetwork3.subnet_id
  vm_size              = "Standard_DS1_v2"
  admin_username       = "azureuser"
  admin_password       = "P@ssw0rd1234"
}

module "linux_vm_spoke4" {
  source               = "./modules/linux-vm"
  vm_name              = "spoke4-vm"
  resource_group_name  = azurerm_resource_group.HubAndSpokeTF.name
  location             = module.spokenetwork4.location
  subnet_id            = module.spokenetwork4.subnet_id
  vm_size              = "Standard_DS1_v2"
  admin_username       = "azureuser"
  admin_password       = "P@ssw0rd1234"
}