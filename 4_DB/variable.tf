variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    type =map
    default = {
        Project = "Gspann"
        Terraform = "true"
    }
}

variable "username" {
    type = string
    default = "dbadmin"
}

variable "db_password" {
    type = string
    default = "Saikrishna!22"
}

variable "zone_name" {
    default ="daws78s.online"
}
