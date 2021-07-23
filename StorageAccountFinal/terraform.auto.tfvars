subscription = "7f0fe5b3-fa78-481f-b5c9-ddbba7e8be4b"
//subscription = "7066de24-cacc-47b5-9f32-4574aa902927"
tenant = "99f319d8-46a3-4b15-857e-8fb6d3f27527"



resource_groups = {
   Storage_Resources_Group = {
    rg_name  = "TERRAFORM_TEST" //TERRAFORM_TEST
    location = "EastUS2"
  }
}

tags = {
  Environment = "PROD"
  Project_name = "FHIR" 
  ClientName   = "SHRD"
  Role         = "DB"
  Tier         = 1
  Buildby      = "Baskaran"    
}

storage_account = {
    Storage1 = {
        rg_key = "Storage_Resources_Group"
        name   =  "astorageaccountn44111"
        account_kind = "StorageV2"
        account_tier   = "Standard" 
        account_type   = "StorageV2"
        account_replication_type = "LRS"
        access_tier = "Hot"
        enable_https_traffic_only = true 
        min_tls_version = "TLS1_2"
        allow_blob_public_access = false
        is_hns_enabled = true
        large_file_share_enabled = false
  }
  Storage2 = {
        rg_key = "Storage_Resources_Group"
        name   =  "bstorageaccoun66222"
        account_kind = "StorageV2"
        account_tier   = "Standard" 
        account_type   = "StorageV2"
        account_replication_type = "LRS"
        access_tier = "Hot"
        enable_https_traffic_only = true 
        min_tls_version = "TLS1_2"
        allow_blob_public_access = false
        is_hns_enabled = true
        large_file_share_enabled = false
  },
  Storage3 = {
        rg_key = "Storage_Resources_Group"
        name   =  "cstorageaccoun66333"
        account_kind = "StorageV2"
        account_tier   = "Standard" 
        account_type   = "StorageV2"
        account_replication_type = "LRS"
        access_tier = "Hot"
        enable_https_traffic_only = true 
        min_tls_version = "TLS1_2"
        allow_blob_public_access = false
        is_hns_enabled = true
        large_file_share_enabled = false
  },
  Storage4 = {
        rg_key = "Storage_Resources_Group"
        name   =  "cstorageaccoun4444"
        account_kind = "StorageV2"
        account_tier   = "Standard" 
        account_type   = "StorageV2"
        account_replication_type = "LRS"
        access_tier = "Hot"
        enable_https_traffic_only = true 
        min_tls_version = "TLS1_2"
        allow_blob_public_access = false
        is_hns_enabled = true
        large_file_share_enabled = false
  }
}

sa_custom_domain = {}
sa_identity = {}
sa_blob_properties = {}
sa_queue_properties = {}
sa_static_website = {}
sa_network_rules = {}
//sa_azure_files_authentication = {}
//sa_routing = {}      