output "sp_id" {
    value = { for i in data.azurerm_app_service_plan.asp : i.name => i.id }
}