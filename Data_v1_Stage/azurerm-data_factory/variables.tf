variable "resource_groups" {
    description = "Azure resource group name"
    default = {
        rg1 = {
            rg_name = null
            location = null
        }
    }
}

variable "data_factory" {
    default = {
        df1 = {
            rg_key = null
            name = "DF1"
            public_network_enabled = true
            github_configuration = [{
                account_name = null
                branch_name = null
                git_url = null
                repository_name = null
                root_folder = null
            }]
            identity = [{
                type = null
            }]
            vsts_configuration = [{
                account_name = null
                branch_name = null
                project_name = null
                repository_name = null
                root_folder = null
                tenant_id = null
            }]
        }
    }

    description = <<EOF
        The following arguments are supported:

        name - (Required) Specifies the name of the Data Factory. Changing this forces a new resource to be created. Must be globally unique. See the Microsoft documentation for all restrictions.

        resource_group_name - (Required) The name of the resource group in which to create the Data Factory.

        location - (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

        public_network_enabled - (Optional) Is the Data Factory visible to the public network? Defaults to true.

        
        
        A identity block supports the following:

        type - (Required) Specifies the identity type of the Data Factory. At this time the only allowed value is SystemAssigned.

        
        
        
        A github_configuration block supports the following:

        account_name - (Required) Specifies the GitHub account name.

        branch_name - (Required) Specifies the branch of the repository to get code from.

        git_url - (Required) Specifies the GitHub Enterprise host name. For example: https://github.mydomain.com. Use https://github.com for open source repositories.

        repository_name - (Required) Specifies the name of the git repository.

        root_folder - (Required) Specifies the root folder within the repository. Set to / for the top level.

        Note:
        You must log in to the Data Factory management UI to complete the authentication to the GitHub repository.


        A vsts_configuration block supports the following:

        account_name - (Required) Specifies the VSTS account name.

        branch_name - (Required) Specifies the branch of the repository to get code from.

        project_name - (Required) Specifies the name of the VSTS project.

        repository_name - (Required) Specifies the name of the git repository.

        root_folder - (Required) Specifies the root folder within the repository. Set to / for the top level.

        tenant_id - (Required) Specifies the Tenant ID associated with the VSTS account.

        tags - (Optional) A mapping of tags to assign to the resource.

    EOF
}

variable "tags" {
  
}