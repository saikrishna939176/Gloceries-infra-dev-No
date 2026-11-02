resource "aws_ssm_parameter" "vpc_id" {
    name = "/${var.projectname}/${var.environment}/vpc-id"
    type = "String"
    value = module.vpc_test.vpc_id
}

resource "aws_ssm_parameter" "public_subnet" {
    name = "/${var.projectname}/${var.environment}/public_subnet-id"
    type = "StringList"
    value = join("," ,module.vpc_test.public_subnets_id) #converting  list to stringlist
}

#["id1","id2"] terraform format
#id1,id2 AWS SSM format

resource "aws_ssm_parameter" "private_subnet" {
    name = "/${var.projectname}/${var.environment}/private_subnet-id"
    type = "StringList"
    value = join("," ,module.vpc_test.private_subnets_id)#converting  list to stringlist
}

resource "aws_ssm_parameter" "database_subent_group_name" {
    name = "/${var.projectname}/${var.environment}/database_subent_group_name"
    type = "String"
    value = module.vpc_test.database_subent_group_name
}