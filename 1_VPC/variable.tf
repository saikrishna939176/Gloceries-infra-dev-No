variable "projectname" {
    default = "expense"
}


variable "common_tags" {
    type=map
    default = {
        Project = "kohls"
      #  Environment = "prod"
        Terraform ="true"
    }
}

variable "public_subnet_cidr" {
    type = list
    default = ["22.0.1.0/24", "22.0.2.0/24"]
}

variable "environment" {
    type = string
    default = "dev"
}

variable "private_subnet_cidr" {
    type = list
    default = ["22.0.4.0/24", "22.0.5.0/24"]
}

variable "database_subnet_cidr" {
    type = list
    default = ["22.0.6.0/24", "22.0.7.0/24"]
}
# variable "is_peering_connection" {
#     type =bool
#     default =true
# }