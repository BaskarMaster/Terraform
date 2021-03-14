variable "resource_groups" {
    description = "Azure resource group name"
    default = {
        rg1 = {
            rg_name = null
            location = null
        }
    }
}

variable "availabilityset" {
    default = {
        aset1 = {
            name = null
            rg_key = null
        }
    }
}

variable "tags" {
    description = "Azure tag assign to resources"
    type = map
    default = {
        Environment  = null
    }
}