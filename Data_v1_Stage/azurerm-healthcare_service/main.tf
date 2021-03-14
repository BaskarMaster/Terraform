variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = length(var.dependson)
  }
}

resource "azurerm_healthcare_service" "hs" {
  for_each = var.hc_service
  name                = each.value["name"]
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
  location            = lookup(var.resource_groups, each.value["rg_key"], null)["location"]
  kind                = each.value["kind"]
  cosmosdb_throughput = each.value["cosmosdb_throughput"]

  tags = var.tags
  depends_on = [null_resource.depends]
  dynamic "authentication_configuration" {
    for_each = each.value["authentication_configuration"] == [] ? [] : each.value["authentication_configuration"]
    content {
      authority           = each.value["authority"]
      audience            = each.value["audience"]
      smart_proxy_enabled = each.value["smart_proxy_enabled"]
    }
  }

  dynamic "cors_configuration" {
    for_each = each.value["cors_configuration"] == [] ? [] : each.value["cors_configuration"]
    content {
      allowed_origins    = each.value["allowed_origins"]
      allowed_headers    = each.value["allowed_headers"]
      allowed_methods    = each.value["allowed_methods"]
      max_age_in_seconds = each.value["max_age_in_seconds"]
      allow_credentials  = each.value["allow_credentials"]
    }
  }
}