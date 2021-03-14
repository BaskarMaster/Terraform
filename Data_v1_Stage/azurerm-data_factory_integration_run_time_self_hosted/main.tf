variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = length(var.dependson)
  }
}


resource "azurerm_data_factory_integration_runtime_self_hosted" "ir" {
    for_each = var.df_irs
    name                = each.value["name"]
    resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
    data_factory_name   = lookup(var.data_factory, each.value["df_key"], null)["name"]
    description = each.value["description"]
    dynamic "rbac_authorization" {
        for_each = each.value["rbac_authorization"] == [] ? [] : each.value["rbac_authorization"]
        content {
            resource_id = each.value["resource_id"]
        }
    }
    depends_on = [ null_resource.depends ]
}
