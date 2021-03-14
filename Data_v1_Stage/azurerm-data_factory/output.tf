output "df_id" {
  value = {for i in azurerm_data_factory.df : i.name => i.id }
}