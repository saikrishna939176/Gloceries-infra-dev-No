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
        component = "backend"
    }
}

# variable "ami_id" {
#     default = "ami-0f79ef8ffa0f2dd69"
# }