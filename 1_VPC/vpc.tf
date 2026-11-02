module "vpc_test" {
    source = "../../Terraform_VPC_Module"
    #source = "git::https://github.com/saikrishna939176/Terraform-VPC-Module.git"
    project_name = var.projectname
    common_tags = var.common_tags
    public_subnet_cidr = var.public_subnet_cidr
    environment = var.environment
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
    # is_peering_connection = var.is_peering_connection
}