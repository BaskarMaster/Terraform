output "availability_set_id" {
    value = { for i in azurerm_availability_set.aset : i.name => i.id }    
}
output "aset_id" {
    value = [for i in azurerm_availability_set.aset : i.id]  
}
