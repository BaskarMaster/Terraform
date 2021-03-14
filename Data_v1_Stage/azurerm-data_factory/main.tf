variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = length(var.dependson)
  }
}

resource "azurerm_data_factory" "df" {
  for_each = var.data_factory
  name                = each.value["name"]
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
  location            = lookup(var.resource_groups, each.value["rg_key"], null)["location"]
  public_network_enabled = each.value["public_network_enabled"]
  
  dynamic "github_configuration"  {
    for_each = each.value["github_configuration"] == [] ? [] : each.value["github_configuration"]
    content {
        account_name = each.value["account_name"]
        branch_name = each.value["branch_name"]
        git_url = each.value["git_url"]
        repository_name = each.value["repository_name"]
        root_folder = each.value["root_folder"]
    }
  }

  dynamic "identity" {
    for_each = each.value["identity"] == [] ? [] : each.value["identity"]
    content {
      type = each.value["type"]
    }
  }

  dynamic "vsts_configuration" {
    for_each = each.value["vsts_configuration"] == [] ? [] : each.value["vsts_configuration"]
    content {
      account_name = each.value["account_name"]
      branch_name = each.value["branch_name"]
      project_name = each.value["project_name"]
      repository_name = each.value["repository_name"]
      root_folder = each.value["root_folder"]
      tenant_id = each.value["tenant_id"]
    }
  }
  tags = var.tags
  depends_on = [null_resource.depends]
}