variable "resource_groups" {
    description = "Azure resource group name"
    default = {
        rg1 = {
            rg_name = null
            location = null
        }
    }
}
variable "app_insights"  {
    default = {
        rg_key = "rg1"
        name = "AIN1"
        application_type = "other"
        daily_data_cap_in_gb = null
        daily_data_cap_notifications_disabled = null
        retention_in_days  = 90
        sampling_percentage = null
        disable_ip_masking = "0.0.0.0"
    }

    description = <<EOF
        name - (Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created.

        resource_group_name - (Required) The name of the resource group in which to create the Application Insights component.

        location - (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

        application_type - (Required) Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created.

        daily_data_cap_in_gb - (Optional) Specifies the Application Insights component daily data volume cap in GB.

        daily_data_cap_notifications_disabled - (Optional) Specifies if a notification email will be send when the daily data volume cap is met.

        retention_in_days - (Optional) Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90.

        sampling_percentage - (Optional) Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry.

        disable_ip_masking - (Optional) By default the real client ip is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client ip. Defaults to false.

EOF
}

variable "tags" {
  
}