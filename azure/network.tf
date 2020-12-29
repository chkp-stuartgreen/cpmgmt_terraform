resource "azurerm_virtual_network" "vnet_mgmt" {
  name          = var.vnet_name
  address_space = var.vnet_cidr
  location      = var.az_location
  resource_group_name = azurerm_resource_group.rg_mgmt.name

}

resource "azurerm_subnet" "subnet_mgmt" {
  name                 = var.subnet_mgmt_name
  resource_group_name  = azurerm_resource_group.rg_mgmt.name
  virtual_network_name = azurerm_virtual_network.vnet_mgmt.name
  address_prefixes     = var.subnet_mgmt_cidr

}

resource "azurerm_public_ip" "public_ip_mgmt" {
  name = "mgmtPublicIP"
  resource_group_name = azurerm_resource_group.rg_mgmt.name
  location = var.az_location
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_network_interface" "mgmt_nic" {
  name = "mgmt-eth0"
  location = var.az_location
  resource_group_name = var.rg_name

  ip_configuration {
    name = "externalNIC"
    subnet_id = azurerm_subnet.subnet_mgmt.id
    private_ip_address_version = "IPv4"
    private_ip_address_allocation = "Dynamic"
    primary = true
    public_ip_address_id = azurerm_public_ip.public_ip_mgmt.id
  }
}