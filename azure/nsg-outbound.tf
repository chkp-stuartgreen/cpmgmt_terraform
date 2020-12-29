


resource "azurerm_network_security_rule" "nsg_rule_outbound" {
  name = "mgmt_nsg_outbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_mgmt.name
  network_security_group_name = azurerm_network_security_group.nsg_mgmt.name
}