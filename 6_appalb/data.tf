data "aws_ssm_parameter" "app_alb_sg_id" {
    name            = "/${var.project_name}/${var.environment}/app_alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
    name            = "/${var.project_name}/${var.environment}/private_subnet-id"
}

# data "aws_ami" "ami_id" {
#     owners             = ["679593333241"] # Official AWS Marketplace Owner ID
#     most_recent        = true
#     filter {
#         name   = "name"
#         values = ["OpenVPN Access Server*"] 
#         # Added wildcard asterisk above ^
#     }

#     filter {
#         name   = "root-device-type"
#         values = ["EBS"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
# }

