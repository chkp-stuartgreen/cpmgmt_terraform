# Terraform template - Check Point Security Management Server for Azure.

###  This template will use Terraform to deploy a standard Check Point Security Management server. 

- You can use the 14 day built-in evaluation license or apply your own (BYOL) license. 
- A default NSG is applied for inbound services based on the Azure Marketplace template allowing:
    > Inbound TCP ["22", "443", "18190", "19009", "257", "18210", "18264", "18191"]

### Instructions for use

- Make sure you have the Azure CLI installed and configured (Terraform needs this)
- Download the template files into a folder / clone the repository
- Set the two environment variables __TF_VAR_admin_password__ (for your admin password to the Mgmt server) and __TG_VAR_subscription_id__ (the subscription to deploy the management server into)
- Run 'terraform plan' and check you are happy with the changes
- Run 'terraform apply' to build. You will get the IP address of the managment server once deployment is complete
- If you've completed your testing and want to trash everything - run 'terraform destroy'

### Changes

- Broke out the code from main.tf into separate files