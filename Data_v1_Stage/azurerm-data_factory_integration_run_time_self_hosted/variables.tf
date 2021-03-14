variable "resource_groups" {

}

variable "data_factory" {}
variable "df_irs" {
    default = {
        ir1 = {
            name = "df-irs"
            rg_key = "rg1"
            df_key = "df1"
            description = null
            rbac_authorization = [{
                resource_id = null
            }]
        }
    }
}