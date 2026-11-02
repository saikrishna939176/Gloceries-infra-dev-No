data "aws_ssm_parameter" "bastion_sg_id" {
    name            = "/${var.project_name}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnet_id" {
    name            = "/${var.project_name}/${var.environment}/public_subnet-id"
}

data "aws_ami" "ami_id" {
    owners = ["137112412989"]

    filter {
        name = "name"
        values = ["al2023-ami-2023.12.20260803.3-kernel-6.18-x86_64"]
    }

}