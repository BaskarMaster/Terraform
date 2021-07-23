output "sg_uri" {
    value = {for i in azurerm_storage_account.storage : i.name=> i.primary_blob_endpoint }
}

output "storageid" {
 value = {for i in azurerm_storage_account.storage : i.name => i.id }
}

output "storageids" {
 value = [for i in azurerm_storage_account.storage :  i.id ]
}