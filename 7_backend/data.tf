data "aws_ssm_parameter" "backend_sg_id" {
    name            = "/${var.project_name}/${var.environment}/backend_sg_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
    name            = "/${var.project_name}/${var.environment}/private_subnet-id"
}

data "aws_ami" "ami_id" {
    owners = ["137112412989"]

    filter {
        name = "name"
        values = ["al2023-ami-2023.12.20260803.3-kernel-6.18-x86_64"]
    }

}