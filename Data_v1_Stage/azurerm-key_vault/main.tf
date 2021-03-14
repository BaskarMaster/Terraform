variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = length(var.dependson)
  }
}


data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each = var.keyvault
  name                        = each.value["name"]
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
  location            = lookup(var.resource_groups, each.value["rg_key"], null)["location"]
  enabled_for_disk_encryption = each.value["enabled_for_disk_encryption"]
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value["soft_delete_retention_days"]
  purge_protection_enabled    = each.value["purge_protection_enabled"]

  sku_name = each.value["sku_name"]
  depends_on = [null_resource.depends]

  dynamic "access_policy" {
    for_each = each.value["access_policy"] == [] ? [] : each.value["access_policy"]
    content {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    application_id = each.value["application_id"]
    key_permissions = each.value["key_permissions"]
    secret_permissions = each.value["secret_permissions"]
    storage_permissions = each.value["storage_permissions"]
    }
  }

  dynamic "network_acls" {
    for_each = each.value["network_acls"] == [] ? [] : each.value["network_acls"]
    content {
                bypass = null
                default_action = null
                ip_rules = null
                virtual_network_subnet_ids = null
    }
  }

  dynamic "contact" {
    for_each = each.value["contact"] == [] ? [] : each.value["contact"]
    content {
                email = null
                name = null
                phone = null
    }
  }
}