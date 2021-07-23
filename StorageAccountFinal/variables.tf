variable "subscription" {}
variable "tenant" {}

variable "resource_groups" {
    description = "Azure resource group name"
    default = {
        rg1 = {
            rg_name = null
            location = null
        }
    }
}
variable "tags" {

}

variable "storage_account" {
    description = "Azure map variable for storage account"
    default = {
        sg1 = {
            rg_key = null
            name   = null
            account_kind = null
            account_tier   = null
            account_type   = null
            account_replication_type = null
            access_tier = null 
            enable_https_traffic_only = null
            min_tls_version = null 
            allow_blob_public_access = null
            is_hns_enabled = null
            nfsv3_enabled = null
            large_file_share_enabled = null 

        }
    }
}

variable "sa_custom_domain" {
    description = "Azure map variable for custom domain"
    default = {
        sacd = {
            name = null
            use_subdomain = null
        }
    }  
}
variable "sa_identity" {
    description = "Azure map variable for custom domain"
    default = {
        said = {
            type = null
            identity_ids = null
        }
    }
}
variable "sa_blob_properties" {
    description = "Azure map variable for storage account blob properties"
    default = {
        sabp = {
            allowed_headers = null
            allowed_methods = null
            allowed_origins = null
            exposed_headers = null
            max_age_in_seconds = null
            delete_retention_policy = [{
                days = null
            }]
            container_delete_retention_policy = [{
                days = null
            }]
            versioning_enabled = null
            change_feed_enabled = null
            default_service_version = null
            last_access_time_enabled = null        
            
        }
    }
}
variable "sa_queue_properties" {
    description = "Azure map variable for storage account"
    default = {
        saqp1 = {
            allowed_headers = null
            allowed_methods = null
            allowed_origins = null
            exposed_headers = null
            max_age_in_seconds = null
            logging = [{
                delete = null
                read = null
                version = null
                write = null
                retention_policy_days = null
            }]
            minute_metrics = [{
                enabled = null
                version = null
                include_apis = null
                retention_policy_days = null
            }]
            hour_metrics = [{
                enabled = null
                version = null
                include_apis = null
                retention_policy_days = null
            }]
            
        }
    }
}
variable "sa_static_website" {
    description = "Azure map variable for storage account"
    default = {
        sasw1 = {
            index_document = null
            error_404_document = null
        }
    }
}
variable "sa_network_rules" {
    description = "Azure map variable for storage account"
    default = {
        sanr = {
            default_action = null
            bypass = null
            ip_rules = null
            virtual_network_subnet_ids = null
            private_link_access = [{
                endpoint_resource_id = null
                endpoint_tenant_id = null
            }]
        }
    }
}
/*variable "sa_azure_files_authentication" {
    description = "Azure map variable for storage account azure files authentication"
    default = {
        safa1 = {
            directory_type = null
            active_directory = [{
                storage_sid = null
                domain_name = null
                domain_sid = null
                domain_guid = null
                forest_name = null
                netbios_domain_name = null   
            }]

        }
    }
}
variable "sa_routing" {
    description = "Azure map variable for storage account routing"
    default = {
        sar = {
            publish_internet_endpoints = null
            publish_microsoft_endpoints = null
            choice = null
        }
    }
}*/


/*variable "tags" {}
variable "tenant_id" {}

variable "sa_custom_domain" {}
variable "sa_identity" {}
variable "sa_blob_properties" {}
variable "sa_queue_properties" {}
variable "sa_static_website" {}
variable "sa_network_rules" {}
variable "sa_azure_files_authentication" {}
variable "sa_routing" {}*/


/*
The following arguments are supported:

name - (Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group.

resource_group_name - (Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created.

location - (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

account_kind - (Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2.

NOTE:
Changing the account_kind value from Storage to StorageV2 will not trigger a force new on the storage account, it will only upgrade the existing storage account from Storage to StorageV2 keeping the existing storage account in place.

account_tier - (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created.

account_replication_type - (Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS.

access_tier - (Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot.

enable_https_traffic_only - (Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true.

min_tls_version - (Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_0 for new storage accounts.

NOTE:
At this time min_tls_version is only supported in the Public Cloud, China Cloud, and US Government Cloud.

allow_blob_public_access - Allow or disallow public access to all blobs or containers in the storage account. Defaults to false.
NOTE:
At this time allow_blob_public_access is only supported in the Public Cloud, China Cloud, and US Government Cloud.

is_hns_enabled - (Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (see here for more information). Changing this forces a new resource to be created.
NOTE:
This can only be true when account_tier is Standard or when account_tier is Premium and account_kind is BlockBlobStorage

nfsv3_enabled - (Optional) Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to false.
NOTE:
This can only be true when account_tier is Standard and account_kind is StorageV2, or account_tier is Premium and account_kind is BlockBlobStorage. Additionally, the is_hns_enabled is true, and enable_https_traffic_only is false.

custom_domain - (Optional) A custom_domain block as documented below.

identity - (Optional) A identity block as defined below.

blob_properties - (Optional) A blob_properties block as defined below.

queue_properties - (Optional) A queue_properties block as defined below.

NOTE:
queue_properties cannot be set when the access_tier is set to BlobStorage

static_website - (Optional) A static_website block as defined below.
NOTE:
static_website can only be set when the account_kind is set to StorageV2 or BlockBlobStorage.

network_rules - (Optional) A network_rules block as documented below.

large_file_share_enabled - (Optional) Is Large File Share Enabled?

azure_files_authentication - (Optional) A azure_files_authentication block as defined below.

routing - (Optional) A routing block as defined below.

tags - (Optional) A mapping of tags to assign to the resource.

A blob_properties block supports the following:

cors_rule - (Optional) A cors_rule block as defined below.

delete_retention_policy - (Optional) A delete_retention_policy block as defined below.

versioning_enabled - (Optional) Is versioning enabled? Default to false.

change_feed_enabled - (Optional) Is the blob service properties for change feed events enabled? Default to false.

default_service_version - (Optional) The API Version which should be used by default for requests to the Data Plane API if an incoming request doesn't specify an API Version. Defaults to 2020-06-12.

last_access_time_enabled - (Optional) Is the last access time based tracking enabled? Default to false.

container_delete_retention_policy - (Optional) A container_delete_retention_policy block as defined below.

Note:
Before setting container_delete_retention_policy, the feature ContainerSoftDelete needs to be enabled by steps

A cors_rule block supports the following:

allowed_headers - (Required) A list of headers that are allowed to be a part of the cross-origin request.

allowed_methods - (Required) A list of http headers that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.

allowed_origins - (Required) A list of origin domains that will be allowed by CORS.

exposed_headers - (Required) A list of response headers that are exposed to CORS clients.

max_age_in_seconds - (Required) The number of seconds the client should cache a preflight response.

A custom_domain block supports the following:

name - (Required) The Custom Domain Name to use for the Storage Account, which will be validated by Azure.
use_subdomain - (Optional) Should the Custom Domain Name be validated by using indirect CNAME validation?
A delete_retention_policy block supports the following:

days - (Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7.
A container_delete_retention_policy block supports the following:

days - (Optional) Specifies the number of days that the container should be retained, between 1 and 365 days. Defaults to 7.
A hour_metrics block supports the following:

enabled - (Required) Indicates whether hour metrics are enabled for the Queue service. Changing this forces a new resource.

version - (Required) The version of storage analytics to configure. Changing this forces a new resource.

include_apis - (Optional) Indicates whether metrics should generate summary statistics for called API operations.

retention_policy_days - (Optional) Specifies the number of days that logs will be retained. Changing this forces a new resource.

A identity block supports the following:

type - (Required) Specifies the identity type of the Storage Account. Possible values are SystemAssigned, UserAssigned, SystemAssigned,UserAssigned (to enable both).
Note
The assigned principal_id and tenant_id can be retrieved after the identity type has been set to SystemAssigned and Storage Account has been created. More details are available below.

identity_ids - (Optional) A list of IDs for User Assigned Managed Identity resources to be assigned.
NOTE:
This is required when type is set to UserAssigned or SystemAssigned, UserAssigned.

A logging block supports the following:

delete - (Required) Indicates whether all delete requests should be logged. Changing this forces a new resource.

read - (Required) Indicates whether all read requests should be logged. Changing this forces a new resource.

version - (Required) The version of storage analytics to configure. Changing this forces a new resource.

write - (Required) Indicates whether all write requests should be logged. Changing this forces a new resource.

retention_policy_days - (Optional) Specifies the number of days that logs will be retained. Changing this forces a new resource.

A minute_metrics block supports the following:

enabled - (Required) Indicates whether minute metrics are enabled for the Queue service. Changing this forces a new resource.

version - (Required) The version of storage analytics to configure. Changing this forces a new resource.

include_apis - (Optional) Indicates whether metrics should generate summary statistics for called API operations.

retention_policy_days - (Optional) Specifies the number of days that logs will be retained. Changing this forces a new resource.

A network_rules block supports the following:

default_action - (Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow.

bypass - (Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None.

ip_rules - (Optional) List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed.

virtual_network_subnet_ids - (Optional) A list of resource ids for subnets.

private_link_access - (Optional) One or More private_link_access block as defined below.

Note:
If specifying network_rules, one of either ip_rules or virtual_network_subnet_ids must be specified and default_action must be set to Deny.

NOTE:
Network Rules can be defined either directly on the azurerm_storage_account resource, or using the azurerm_storage_account_network_rules resource - but the two cannot be used together. If both are used against the same Storage Account, spurious changes will occur. When managing Network Rules using this resource, to change from a default_action of Deny to Allow requires defining, rather than removing, the block.

Note:
The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.

Note:
More information on Validation is available here

A private_link_access block supports the following:

endpoint_resource_id - (Required) The resource id of the resource access rule to be granted access.

endpoint_tenant_id - (Optional) The tenant id of the resource of the resource access rule to be granted access. Defaults to the current tenant id.

A azure_files_authentication block supports the following:

directory_type - (Required) Specifies the directory service used. Possible values are AADDS and AD.

active_directory - (Optional) A active_directory block as defined below. Required when directory_type is AD.

A active_directory block supports the following:

storage_sid - (Required) Specifies the security identifier (SID) for Azure Storage.

domain_name - (Required) Specifies the primary domain that the AD DNS server is authoritative for.

domain_sid - (Required) Specifies the security identifier (SID).

domain_guid - (Required) Specifies the domain GUID.

forest_name - (Required) Specifies the Active Directory forest.

netbios_domain_name - (Required) Specifies the NetBIOS domain name.

A routing block supports the following:

publish_internet_endpoints - (Optional) Should internet routing storage endpoints be published? Defaults to false.

publish_microsoft_endpoints - (Optional) Should microsoft routing storage endpoints be published? Defaults to false.

choice - (Optional) Specifies the kind of network routing opted by the user. Possible values are InternetRouting and MicrosoftRouting. Defaults to MicrosoftRouting.

A queue_properties block supports the following:

cors_rule - (Optional) A cors_rule block as defined above.

logging - (Optional) A logging block as defined below.

minute_metrics - (Optional) A minute_metrics block as defined below.

hour_metrics - (Optional) A hour_metrics block as defined below.

A static_website block supports the following:

index_document - (Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive.

error_404_document - (Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file.

Attributes Reference
The following attributes are exported in addition to the arguments listed above:

id - The ID of the Storage Account.

primary_location - The primary location of the storage account.

secondary_location - The secondary location of the storage account.

primary_blob_endpoint - The endpoint URL for blob storage in the primary location.

primary_blob_host - The hostname with port if applicable for blob storage in the primary location.

secondary_blob_endpoint - The endpoint URL for blob storage in the secondary location.

secondary_blob_host - The hostname with port if applicable for blob storage in the secondary location.

primary_queue_endpoint - The endpoint URL for queue storage in the primary location.

primary_queue_host - The hostname with port if applicable for queue storage in the primary location.

secondary_queue_endpoint - The endpoint URL for queue storage in the secondary location.

secondary_queue_host - The hostname with port if applicable for queue storage in the secondary location.

primary_table_endpoint - The endpoint URL for table storage in the primary location.

primary_table_host - The hostname with port if applicable for table storage in the primary location.

secondary_table_endpoint - The endpoint URL for table storage in the secondary location.

secondary_table_host - The hostname with port if applicable for table storage in the secondary location.

primary_file_endpoint - The endpoint URL for file storage in the primary location.

primary_file_host - The hostname with port if applicable for file storage in the primary location.

secondary_file_endpoint - The endpoint URL for file storage in the secondary location.

secondary_file_host - The hostname with port if applicable for file storage in the secondary location.

primary_dfs_endpoint - The endpoint URL for DFS storage in the primary location.

primary_dfs_host - The hostname with port if applicable for DFS storage in the primary location.

secondary_dfs_endpoint - The endpoint URL for DFS storage in the secondary location.

secondary_dfs_host - The hostname with port if applicable for DFS storage in the secondary location.

primary_web_endpoint - The endpoint URL for web storage in the primary location.

primary_web_host - The hostname with port if applicable for web storage in the primary location.

secondary_web_endpoint - The endpoint URL for web storage in the secondary location.

secondary_web_host - The hostname with port if applicable for web storage in the secondary location.

primary_access_key - The primary access key for the storage account.

secondary_access_key - The secondary access key for the storage account.

primary_connection_string - The connection string associated with the primary location.

secondary_connection_string - The connection string associated with the secondary location.

primary_blob_connection_string - The connection string associated with the primary blob location.

secondary_blob_connection_string - The connection string associated with the secondary blob location.

NOTE:
If there's a Write Lock on the Storage Account, or the account doesn't have permission then these fields will have an empty value due to a bug in the Azure API

identity - An identity block as defined below, which contains the Identity information for this Storage Account.
A share_properties block supports the following:

cors_rule - (Optional) A cors_rule block as defined below.

retention_policy - (Optional) A retention_policy block as defined below.

smb - (Optional) A smb block as defined below.

A retention_policy block supports the following:

days - (Optional) Specifies the number of days that the azurerm_storage_share should be retained, between 1 and 365 days. Defaults to 7.
A smb block supports the following:

versions - (Optional) A set of SMB protocol versions. Possible values are SMB2.1, SMB3.0, and SMB3.1.1.

authentication_types - (Optional) A set of SMB authentication methods. Possible values are NTLMv2, and Kerberos.

kerberos_ticket_encryption_type - (Optional) A set of Kerberos ticket encryption. Possible values are RC4-HMAC, and AES-256.

channel_encryption_type - (Optional) A set of SMB channel encryption. Possible values are AES-128-CCM, AES-128-GCM, and AES-256-GCM.

identity exports the following:

principal_id - The Principal ID for the Service Principal associated with the Identity of this Storage Account.

tenant_id - The Tenant ID for the Service Principal associated with the Identity of this Storage Account.

Note
You can access the Principal ID via ${azurerm_storage_account.example.identity.0.principal_id} and the Tenant ID via ${azurerm_storage_account.example.identity.0.tenant_id}
*/
