variable "resource_groups" {
    description = "Azure resource group name"
    default = {
        rg1 = {
            rg_name = "Test"
            location = "EASTUS2"
        }
    }
}

variable "app_service_plans" {
    description = <<EOF
        The following arguments are supported:

            rg_key - (Required) Specifies existing resource group name using Key reference in resource_groups variable.
            name - (Required) Specifies the name of the App Service Plan component. Changing this forces a new resource to be created.

        EOF

    default = {
            sp1 = {
                rg_key = "rg1"
                name = "ASP1"
            }
    }
}