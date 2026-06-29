output "debug" {
  value = {
    vnet_id = azurerm_virtual_network.vnet.id
    frontend_subnet_id = azurerm_subnet.frontend.id
    backend_subnet_id = azurerm_subnet.backend.id
  }
}