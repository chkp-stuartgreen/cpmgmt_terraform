# Terraform template for creating Check Point Management server

** This is very much a work in progress **

The goal is to deploy a Check Point Security Managment server quickly and easily, with the idea of it being somewhere to process logs outside of your main environment.

Currently - this works in Azure and you need to make sure you have the 'az cli' installed and connected to your Azure account. You also need to add your subscription ID to the terraform.tfvars file.

NOTE! Currently - we are deploying with an open NSG in Azure. This is to speed up deployment, but should be hardened for connections from trusted IPs only. 