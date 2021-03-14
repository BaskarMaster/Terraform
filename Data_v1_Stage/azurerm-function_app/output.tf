output "fnc_id" {
  value = {for i in azurerm_function_app.fun_app : i.name => i.id }
}