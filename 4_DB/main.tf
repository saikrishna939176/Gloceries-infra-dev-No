module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = local.db_identifier

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "transactions"
  
  username = var.username
  
  # CHANGE THIS: Use password_wo for the latest module versions
  password_wo = var.db_password
  password_wo_version = 1 
  
  port     = 3306

  vpc_security_group_ids = [data.aws_ssm_parameter.db_sg_id.value]

  db_subnet_group_name = data.aws_ssm_parameter.db_subnet_group_name.value

  family = "mysql8.0"
  major_engine_version = "8.0"

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name} - ${var.environment} -DB"
    }
  )

  # Note: Since this is set to false, passing password_wo is required
  manage_master_user_password = false
  
  skip_final_snapshot = true
  
  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"
      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
# Create R53 record for RDS endpoint

module "records" {
  source = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 4.0"
  # zone_id = data.aws_ssm_parameter.route53_zone_id.value
    zone_name = var.zone_name


  records = [
   {
      name = "db"
      type = "CNAME"
      ttl = 1
      records = [
        module.db.db_instance_address
      ]
    }
  ]
}
