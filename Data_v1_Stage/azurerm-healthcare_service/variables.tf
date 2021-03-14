variable "hc_service" {
    description = <<EOF
        name - (Required) The name of the service instance. Used for service endpoint, must be unique within the audience.
        resource_group_name - (Required) The name of the Resource Group in which to create the Service.
        location - (Required) Specifies the supported Azure Region where the Service should be created.
        Please Note
        : Not all locations support this resource. Some are West US 2, North Central US, and UK West.

        access_policy_ids - (Optional) A set of Azure object id's that are allowed to access the Service. If not configured, the default value is the object id of the service principal or user that is running Terraform.
        authentication_configuration - (Optional) An authentication_configuration block as defined below.
        cosmosdb_throughput - (Optional) The provisioned throughput for the backing database. Range of 400-1000. Defaults to 400.
        cors_configuration - (Optional) A cors_configuration block as defined below.
        kind - (Optional) The type of the service. Values at time of publication are: fhir, fhir-Stu3 and fhir-R4. Default value is fhir.
        tags - (Optional) A mapping of tags to assign to the resource.
        An authentication_configuration supports the following:

        authority - (Optional) The Azure Active Directory (tenant) that serves as the authentication authority to access the service. The default authority is the Directory defined in the authentication scheme in use when running Terraform. Authority must be registered to Azure AD and in the following format: https://{Azure-AD-endpoint}/{tenant-id}.
        audience - (Optional) The intended audience to receive authentication tokens for the service. The default value is https://azurehealthcareapis.com
        smart_proxy_enabled - (Boolean) Enables the 'SMART on FHIR' option for mobile and web implementations.
        A cors_configuration block supports the following:

        allowed_origins - (Required) A set of origins to be allowed via CORS.
        allowed_headers - (Required) A set of headers to be allowed via CORS.
        allowed_methods - (Required) The methods to be allowed via CORS.
        max_age_in_seconds - (Required) The max age to be allowed via CORS.
        allow_credentials - (Boolean) If credentials are allowed via CORS.
        EOF
    
    default = {
        f1 = {
            name = null
            rg_key = null
            access_policy_ids = null
            cosmosdb_throughput = 400
            kind = "fhir"
            authentication_configuration = [{
                authority = null
                audience = null
                smart_proxy_enabled = null
            }]
            cors_configuration = [{
                allowed_origins = null
                allowed_headers = null
                allowed_methods = null
                max_age_in_seconds = null
                allow_credentials = null
            }]
        }
    }
}

variable "resource_groups" {
  
}

variable "tags" {
  
}