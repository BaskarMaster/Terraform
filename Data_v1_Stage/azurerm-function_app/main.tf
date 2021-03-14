//azurerm_app_service_virtual_network_swift_connection

variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    dependency_id = length(var.dependson)
  }
}


resource "azurerm_function_app" "fun_app" {
  for_each = var.func_apps
  name                       = each.value["name"]
  resource_group_name = lookup(var.resource_groups, each.value["rg_key"], null)["rg_name"]
  location            = lookup(var.resource_groups, each.value["rg_key"], null)["location"]
  app_service_plan_id        = var.sp_id[var.app_service_plans[each.value["sp_key"]]["name"]]
  storage_account_name       = lookup(var.storage_account, each.value["sg_key"], null)["name"]
  storage_account_access_key = var.sg_pak[var.storage_account[each.value["sg_key"]]["name"]]
  os_type                    = each.value["os_type"]
  client_affinity_enabled = each.value["client_affinity_enabled"]
  daily_memory_time_quota = each.value["daily_memory_time_quota"]
  enabled = each.value["enabled"]
  enable_builtin_logging = each.value["enable_builtin_logging"]
  https_only = each.value["https_only"]
  version = each.value["version"]
  tags = var.tags
  depends_on = [null_resource.depends]

  app_settings = var.fnc_app_settings
    

  dynamic "connection_string" {
    for_each = each.value["connection_string"] == [] ? [] : each.value["connection_string"]
    content {
      name = each.value["name"]
      type = each.value["type"]
      value = each.value["value"]
    }
  }
  
  dynamic "site_config" {
    for_each = each.value["site_config"] == [] ? [] : each.value["site_config"]
    content {
          always_on = false
          ftps_state = each.value["ftps_state"]
          health_check_path = each.value["health_check_path"]
          http2_enabled = each.value["http2_enabled"]
          linux_fx_version = each.value["linux_fx_version"]
          min_tls_version = each.value["min_tls_version"]
          pre_warmed_instance_count = each.value["pre_warmed_instance_count"]
          scm_type = each.value["scm_type"]
          scm_use_main_ip_restriction = each.value["scm_use_main_ip_restriction"]
          use_32_bit_worker_process = each.value["use_32_bit_worker_process"]
          websockets_enabled = each.value["websockets_enabled"]
        dynamic "cors" {
          for_each = each.value["cors"] == [] ? [] : each.value["cors"]
            content{
              allowed_origins = each.value["allowed_origins"]
              support_credentials = each.value["support_credentials"]
            }
        }
        dynamic "ip_restriction" {
          for_each = each.value["ip_restriction"] == [] ? [] : each.value["ip_restriction"]
          content {
            ip_address = each.value["ip_address"]
            service_tag = each.value["service_tag"]
            virtual_network_subnet_id = each.value["virtual_network_subnet_id"]
            name = each.value["name"]
            priority = each.value["priority"]
            action = each.value["action"]
          }
        }
        dynamic "scm_ip_restriction" {
          for_each = each.value["scm_ip_restriction"] == [] ? [] : each.value["scm_ip_restriction"]
          content {
            ip_address = each.value["ip_address"]
            service_tag = each.value["service_tag"]
            virtual_network_subnet_id = each.value["virtual_network_subnet_id"]
            name = each.value["name"]
            priority = each.value["priority"]
            action = each.value["action"]
          }
        }
      }
  }    
      
  dynamic "identity" {
    for_each = each.value["identity"] == [] ? [] : each.value["identity"]
      content {
        type = each.value["type"]
        identity_ids = each.value["identity_ids"]
      }
  }
      
  dynamic "auth_settings" {
    for_each = each.value["auth_settings"] == [] ? [] : each.value["auth_settings"]
    content {
      enabled = each.value["enabled"]
      additional_login_params = each.value["additional_login_params"]
      allowed_external_redirect_urls = each.value["allowed_external_redirect_urls"]
      default_provider = each.value["default_provider"]
      issuer = each.value["issuer"]
      runtime_version = each.value["runtime_version"]
      token_refresh_extension_hours = each.value["token_refresh_extension_hours"]
      token_store_enabled = each.value["token_store_enabled"]
      unauthenticated_client_action = each.value["unauthenticated_client_action"]
          
      dynamic "active_directory" {
        for_each = each.value["active_directory"] == [] ? [] : each.value["active_directory"]
        content {
          client_id = each.value["client_id"]
          client_secret = each.value["client_secret"]
          allowed_audiences = each.value["allowed_audiences"]
        }
      }
      dynamic "facebook" {
        for_each = each.value["facebook"] == [] ? [] : each.value["facebook"]
        content {
          app_id = each.value["app_id"]
          app_secret = each.value["app_secret"]
          oauth_scopes = each.value["oauth_scopes"]
        }
      }
      dynamic "google" {
        for_each = each.value["google"] == [] ? [] : each.value["google"]
        content {
          client_id = each.value["client_id"]
          client_secret = each.value["client_secret"]
          oauth_scopes = each.value["oauth_scopes"]
        }
      }
      dynamic "microsoft" {
        for_each = each.value["microsoft"] == [] ? [] : each.value["microsoft"]
        content {
          client_id = each.value["client_id"]
          client_secret = each.value["client_secret"]
          oauth_scopes = each.value["oauth_scopes"]
        }
      }

       dynamic "twitter" {
        for_each = each.value["twitter"] == [] ? [] : each.value["twitter"]
        content {
          consumer_key = each.value["consumer_key"]
          consumer_secret = each.value["consumer_secret"]
        }
      }
  
    }
  }

  dynamic "source_control" {
    for_each = each.value["source_control"] == [] ? [] : each.value["source_control"]
    content {
      repo_url = each.value["repo_url"]
      branch = each.value["branch"]
      manual_integration = each.value["manual_integration"]
      rollback_enabled = each.value["rollback_enabled"]
      use_mercurial = each.value["use_mercurial"]
    }
  }
}