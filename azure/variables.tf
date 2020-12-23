 variable "subscription_id" {
   type = string
 }
 variable "az_location" {
   type = string
 }

variable "vnet_name" {
    type = string
}

variable "vnet_cidr" {
    type = list(string)
}

variable "rg_name" {
    type = string  
}

variable "subnet_mgmt_name" {
    type = string
  
}

variable "subnet_mgmt_cidr" {
    type = list(string)
  
}

variable "cp_osversion" {
    type = string
    default = "R8040"
}

variable "log_server_name" {
  type = string
}

variable "admin_password_hash" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "admin_username" {
    type = string
  
}

#variable "custom_data" {
#  type = string
#}

#"imagePublisher": "checkpoint",
#        "imageReferenceBYOL": {
#            "offer": "[variables('imageOffer')]",
#            "publisher": "[variables('imagePublisher')]",
#            "sku": "mgmt-byol",
#            "version": "latest"
#        },


variable "cloud_config_string" {
    type = string
}