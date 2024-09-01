resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_custom_port" {
  name                        = "Allow-Custom-Port"
  resource_group_name         = var.resource_group_name
  priority                    = var.priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = [var.port]
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  network_security_group_name = azurerm_network_security_group.this.name
}

# Optional assignment to a subnet
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  count                      = var.subnet_id != "" ? 1 : 0
  subnet_id                  = var.subnet_id
  network_security_group_id  = azurerm_network_security_group.this.id
}

# Optional assignment to a network interface
resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  count                      = var.network_interface_id != "" ? 1 : 0
  network_interface_id       = var.network_interface_id
  network_security_group_id  = azurerm_network_security_group.this.id
}
