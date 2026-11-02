resource "aws_key_pair" "backend" {
  key_name   = "openvpn"
  #you can paste the key directly like this
  #public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH3/m2DB/DZIXqIQneuJO6lTVl7JOFW9zO9NHU0TqMTO gspann\sai.devabhakthuni@NODE2567"
  public_key = file("~/.ssh/openvpn.pub")
}


module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  key_name = aws_key_pair.vpn.key_name
  name = "${local.Name} - ${var.common_tags.component}"

  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_sg_id.value]
  #convert stringList to list and get first element
  subnet_id     = local.private_subnet_id
  #ami = data.aws_ami.ami_id.id
  ami = data.aws_ami.ami_id.id
  tags = merge(
    var.common_tags,
    {
        Name = "${local.Name} - ${var.common_tags.component}"
    }
  )
}


resource "null_resource" "backend" {
    triggers = {
        instance_id = module.backend.id #this will be triggered  everytime instance is created 
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("~/.ssh/openvpn") # Path to your private key file
        #key_name = aws_key_pair.backend.key_name
        host = module.backend.private_ip
    }
    
    provisioner "file" {
        source = "${var.common_tags.component}.sh"
        destination = "/tmp/${var.common_tags.component}.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/${var.common_tags.component}.sh",
            "sudo sh /tmp/${var.common_tags.component}.sh ${var.environment}"
        ]
    }
}