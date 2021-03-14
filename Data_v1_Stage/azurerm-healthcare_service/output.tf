output "hs_id" {
  value = {for i in azurerm_healthcare_service.hs : i.name => i.id }
}