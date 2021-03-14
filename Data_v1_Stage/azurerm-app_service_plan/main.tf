variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = length(var.dependson)
  }
}


data "azurerm_app_service_plan" "asp" {
  for_each = var.app_service_plans
  name                = each.value["name"]
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
  depends_on = [ null_resource.depends ]
}
