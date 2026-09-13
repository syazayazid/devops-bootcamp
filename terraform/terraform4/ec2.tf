module "my_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0"

  name                   = "tf4-rackula"
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = module.my_vpc.public_subnets[0]
  create_security_group  = false
  vpc_security_group_ids = [module.my_sg.id]
  iam_instance_profile   = data.aws_iam_instance_profile.my_ssm_profile.name

  user_data = templatefile("userdata.sh", {})
  tags      = { Name = "tf4-rackula" }
}
