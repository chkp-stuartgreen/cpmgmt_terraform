# Subscription ID - make sure you have az cli installed and logged in to your Azure account
subscription_id = ""

# Where do you want the management server deployed
az_location = "West Europe"

# VNet name
vnet_name = "CPMgmtVNet"

# VNet CIDR
vnet_cidr = ["172.16.143.0/24"]

# Subnet name
subnet_mgmt_name = "MgmtSubnet"

# Subnet CIDR
subnet_mgmt_cidr = ["172.16.143.0/25"]

# Resource Group name
rg_name = "CPMgmtRG"

# Log server name
log_server_name = "CPLogServer"

# admin_password
#admin_password = ""

# admin username

admin_username = "sysadmin"

# admin_password_hash
admin_password_hash = "hash_here"

#Build cloud_config here

cloud_config_string = ""

