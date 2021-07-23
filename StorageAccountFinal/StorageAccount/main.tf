variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = join("", flatten(var.dependson))
  }
}

resource "azurerm_storage_account" "storage" {
  for_each = var.storage_account
  name                     = each.value["name"]
  location            = lookup(var.resource_groups, each.value["rg_key"], null)["location"]
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
  account_kind = each.value["account_kind"]
  account_tier             = each.value["account_tier"] 
  account_replication_type = each.value["account_replication_type"]
  access_tier = each.value["access_tier"] 
  enable_https_traffic_only = each.value["enable_https_traffic_only"]
  min_tls_version = each.value["min_tls_version"] 
  allow_blob_public_access = each.value["allow_blob_public_access"]
  is_hns_enabled = each.value["is_hns_enabled"]
  //nfsv3_enabled = each.value["nfsv3_enabled"]
  large_file_share_enabled = each.value["large_file_share_enabled"] 
  tags = var.tags
  //tenant_id = var.tenant_id
  depends_on = [null_resource.depends]
  dynamic "custom_domain" {
    for_each = var.sa_custom_domain == {} ? {} : var.sa_custom_domain
    content {
      name = each.value["name"]
      use_subdomain = each.value["use_subdomain"]
    }
  }

  dynamic "identity" {
    for_each = var.sa_identity == {} ? {} : var.sa_identity
    content {
      type = each.value["type"]
      //identity_ids = each.value["identity_ids"]
    }    
  }

  dynamic "blob_properties" {
    for_each = var.sa_blob_properties == {} ? {} : var.sa_blob_properties
    content {
      dynamic "cors_rule" {
        for_each = each.value["cors_rule"] == [] ? [] : each.value["cors_rule"]
        content {
          allowed_headers = each.value["allowed_headers"]
          allowed_methods = each.value["allowed_methods"]
          allowed_origins = each.value["allowed_origins"]
          exposed_headers = each.value["exposed_headers"]
          max_age_in_seconds = each.value["max_age_in_seconds"]
        }
      }
      dynamic "delete_retention_policy"{
        for_each = each.value["delete_retention_policy"] == [] ? [] : each.value["delete_retention_policy"]
        content {
          days = each.value["days"]
        }
      }
      dynamic "container_delete_retention_policy"{
        for_each = each.value["container_delete_retention_policy"] == [] ? [] : each.value["container_delete_retention_policy"]
        content {
          days = each.value["days"]
        }
      }      
      /*versioning_enabled = each.value["versioning_enabled"]
      change_feed_enabled = each.value["change_feed_enabled"]
      default_service_version = each.value["default_service_version"]
      last_access_time_enabled = each.value["last_access_time_enabled"]*/
    }    
  }

  dynamic "queue_properties" {
    for_each = var.sa_queue_properties == {} ? {} : var.sa_queue_properties
    content {
      dynamic "cors_rule" {
        for_each = each.value["cors_rule"] == [] ? [] : each.value["cors_rule"]
        content {
          allowed_headers = each.value["allowed_headers"]
          allowed_methods = each.value["allowed_methods"]
          allowed_origins = each.value["allowed_origins"]
          exposed_headers = each.value["exposed_headers"]
          max_age_in_seconds = each.value["max_age_in_seconds"]
        }
      }
      dynamic "logging" {
        for_each = each.value["logging"] == [] ? [] : each.value["logging"]
        content {
          delete = each.value["delete"]
          read = each.value["read"]
          version = each.value["version"]
          write = each.value["write"]
          retention_policy_days = each.value["retention_policy_days"]
        }
      }
      dynamic "minute_metrics" {
        for_each = each.value["minute_metrics"] == [] ? [] : each.value["minute_metrics"]
        content {
          enabled = each.value["enabled"]
          version = each.value["version"]
          include_apis = each.value["include_apis"]
          retention_policy_days = each.value["retention_policy_days"]
        }
      }
      dynamic "hour_metrics" {
        for_each = each.value["hour_metrics"] == [] ? [] : each.value["hour_metrics"]
        content {
          enabled = each.value["enabled"]
          version = each.value["version"]
          include_apis = each.value["include_apis"]
          retention_policy_days = each.value["retention_policy_days"]
        }
      } 
    }    
  }

  dynamic "static_website" {
    for_each = var.sa_static_website == {} ? {} : var.sa_static_website
    content {
      index_document = each.value["index_document"]
      error_404_document = each.value["error_404_document"]
    }    
  }

  dynamic "network_rules" {
    for_each = var.sa_network_rules == {} ? {} : var.sa_network_rules
    content {
      default_action = each.value["default_action"]
      bypass = each.value["bypass"]
      ip_rules = each.value["ip_rules"]
      virtual_network_subnet_ids =each.value["virtual_network_subnet_ids"]
      /*dynamic "private_link_access" {
        for_each = each.value["private_link_access"] == [] ? [] : each.value["private_link_access"]
        content {
          endpoint_resource_id = each.value["endpoint_resource_id"]
          endpoint_tenant_id = each.value["endpoint_tenant_id"]
        }
      }*/
    }    
  }

  /*dynamic "azure_files_authentication" {
    for_each = var.sa_azure_files_authentication == {} ? {} : var.sa_azure_files_authentication
    content {
      directory_type = each.value["directory_type"]
      dynamic "active_directory"{
        for_each = each.value["active_directory"] ==[] ? [] : each.value["active_directory"]
        content {
          storage_sid = each.value["storage_sid"]
          domain_name = each.value["domain_name"]
          domain_sid = each.value["domain_sid"]
          domain_guid = each.value["domain_guid"]
          forest_name = each.value["forest_name"]
          netbios_domain_name = each.value["netbios_domain_name"]
        }
      }
    }    
  }

  dynamic "routing" {
    for_each = var.sa_routing == {} ? {} : var.sa_routing
    content {
      publish_internet_endpoints = each.value["publish_internet_endpoints"]
      publish_microsoft_endpoints = each.value["publish_microsoft_endpoints"]
      choice = each.value["choice"]
    }    
  }*/
}
