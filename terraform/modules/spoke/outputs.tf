output "location" {
  value = azurerm_virtual_network.virtual_network.location
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}