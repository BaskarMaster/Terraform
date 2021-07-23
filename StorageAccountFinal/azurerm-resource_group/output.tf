output "rg_id" {
  value = [for i in data.azurerm_resource_group.rg : i.id]
}
