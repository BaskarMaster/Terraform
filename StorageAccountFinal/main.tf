module "resourcegroup" {
  source          = "./azurerm-resource_group"
  resource_groups = var.resource_groups
}


module "STORAGEAC"{
  source          = "./StorageAccount"
  resource_groups = var.resource_groups
  tenant_id = var.tenant
  storage_account = var.storage_account
  sa_custom_domain = var.sa_custom_domain
  sa_identity = var.sa_identity
  sa_blob_properties = var.sa_blob_properties
  sa_queue_properties = var.sa_queue_properties
  sa_static_website = var.sa_static_website
  sa_network_rules = var.sa_network_rules
  //sa_azure_files_authentication = var.sa_azure_files_authentication
  //sa_routing = var.sa_routing
  tags= var.tags
  dependson       = [module.resourcegroup.rg_id]
}
