
# if var.new-vnet is true, create a new vnet, else use existing vnet

resource "azurerm_virtual_network" "vnet" {

  name                = "checkpoint-ha-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.vnet.name
}

// resource_group_name = "cluster-vnet-${var.envId}"
resource "azurerm_resource_group" "vnet" {

  name     = "cluster-vnet-${var.envId}"
  location = "westeurope"
}

// frontend subnet
resource "azurerm_subnet" "frontend" {

  name                 = "Frontend"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.1.0/24"]
}

// backend subnet
resource "azurerm_subnet" "backend" {

  name                 = "Backend"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.2.0/24"]
}

