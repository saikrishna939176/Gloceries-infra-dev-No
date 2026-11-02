data "aws_ssm_parameter" "vpcinfo" {
  name            = "/${var.project_name}/${var.environment}/vpc-id"
}

# data "aws_vpc" "default" {
#   default = true
# }