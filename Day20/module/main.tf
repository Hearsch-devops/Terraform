module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "module_instance"

  instance_type          = var.aws_ec2_type
  ami                    = var.aws_ec2_ami
  key_name               = "terra-keypair"
  monitoring             = true
  subnet_id              = aws_subnet.module_subnet.id
  vpc_security_group_ids = [ aws_security_group.module_sg.id ]

  user_data = file("apache-install.sh")

  tags = {
    Name = "module_demo"
  }
}