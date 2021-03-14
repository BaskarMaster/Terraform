variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = length(var.dependson)
  }
}


resource "azurerm_availability_set" "aset" {
    for_each = var.availabilityset
  name                = each.value["name"]
  location            = lookup(var.resource_groups, each.value["rg_key"], null)["location"]
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
  tags =var.tags
  
}


/*data "azurerm_availability_set" "aset" {
   for_each = var.availabilityset
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
}*/

