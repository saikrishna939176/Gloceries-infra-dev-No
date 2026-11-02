variable "project_name" {
    default = "expense"
}

variable "description" {
    default = "Allow public"
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
variable "ingress"{
    default =  {
        VPN = [
        {
            from_port = 943
            to_port = 943
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 1194
            to_port = 1194
            protocol = "udp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
    }
}