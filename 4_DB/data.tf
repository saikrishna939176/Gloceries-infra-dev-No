data "aws_ssm_parameter" "db_sg_id" {
    name            = "/${var.project_name}/${var.environment}/db_sg_id"
}

data "aws_ssm_parameter" "db_subnet_group_name" {
    name = "/${var.project_name}/${var.environment}/database_subent_group_name"
}
# data "aws_ssm_parameter" "route53_zone_id" {
#     name = "/${var.project_name}/${var.environment}/route53_zone_id"
# }