resource "azurerm_network_security_group" "nsg_mgmt" {
  name = "mgmt_nsg"
  location = var.az_location
  resource_group_name = azurerm_resource_group.rg_mgmt.name

}

## Inbound rules - from CP Marketplace template

resource "azurerm_network_security_rule" "nsg_rule_inbound_allow" {
  name = "mgmt_nsg_inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges      = ["22", "443", "18190", "19009", "257", "18210", "18264", "18191"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_mgmt.name
  network_security_group_name = azurerm_network_security_group.nsg_mgmt.name
}
