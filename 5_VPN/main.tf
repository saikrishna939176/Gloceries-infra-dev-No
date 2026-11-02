resource "aws_key_pair" "vpn" {
  key_name   = "openvpn"
  #you can paste the key directly like this
  #public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH3/m2DB/DZIXqIQneuJO6lTVl7JOFW9zO9NHU0TqMTO gspann\sai.devabhakthuni@NODE2567"
  public_key = file("~/.ssh/openvpn.pub")
}

module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  key_name = aws_key_pair.vpn.key_name
  name = "${local.Name} - vpn"

  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  #convert stringList to list and get first element
  subnet_id     = local.public_subnet_id
  #ami = data.aws_ami.ami_id.id
  ami = var.ami_id
  tags = merge(
    var.common_tags,
    {
        Name = "${local.Name} -VPN"
    }
  )
}



