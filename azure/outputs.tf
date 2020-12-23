output "public_ip_address" {
    description = "IP address of your Smart Center"
    value = azurerm_public_ip.public_ip_mgmt.ip_address
}