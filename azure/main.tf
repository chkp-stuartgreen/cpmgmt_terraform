# Basic resources



resource "azurerm_resource_group" "rg_mgmt" {
  name = var.rg_name
  location = var.az_location
}

resource "azurerm_linux_virtual_machine" "vm_logserver" {
  name = var.log_server_name
  resource_group_name = var.rg_name
  location = var.az_location
  size = "Standard_D3_v2"
  admin_username = var.admin_username
  admin_password = var.admin_password
  # WIP
  disable_password_authentication = var.admin_public_key_file_path != "" ? true : false
  #disable_password_authentication = false
  network_interface_ids = [ azurerm_network_interface.mgmt_nic.id ]
  custom_data = base64encode("#!/usr/bin/python3 /etc/cloud_config.py\n\ninstallationType=\"management\"\nallowUploadDownload=\"true\"\nosVersion=\"r8040\"\ntemplateName=\"management\"\nisBlink=\"false\"\ntemplateVersion=\"20201109\"\nbootstrapScript64=\"\"\nlocation=\"West Europe\"\nmanagementGUIClientNetwork=\"0.0.0.0/0\"\n")
  source_image_reference {
    publisher = "checkpoint"
    offer = "check-point-cg-r8040"
    sku = "mgmt-byol"
    version = "latest"
  }
  dynamic "admin_ssh_key" {
    for_each = var.admin_public_key_file_path != "" ? [1] : []
    content {
      username = "notused"
      public_key = file(var.admin_public_key_file_path)
    }
  }
  
  #admin_ssh_key {
  #  username = "admin"
  #  public_key = file(var.admin_public_key_path)
  #  }  

  plan {
    name = "mgmt-byol"
    product = "check-point-cg-r8040"
    publisher = "checkpoint"
  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = 100
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc_mgmt" {
  subnet_id = azurerm_subnet.subnet_mgmt.id
  network_security_group_id = azurerm_network_security_group.nsg_mgmt.id
}