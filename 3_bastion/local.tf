locals {
    public_subnet_id = element(split("," , data.aws_ssm_parameter.public_subnet_id.value),0)
    Name = "${var.project_name} - ${var.environment}"
}