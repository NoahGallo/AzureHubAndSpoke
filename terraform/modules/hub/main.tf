resource "azurerm_virtual_network" "hub_virtual_network" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "hub_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.name
  address_prefixes     = [var.subnet_address_prefix]

  depends_on = [azurerm_virtual_network.virtual_network]
}

