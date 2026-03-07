resource "aws_instance" "aws_dev" {
  ami           = var.aws_ami_id
  instance_type = var.aws_ec2_type
  user_data = file("apache-install.sh")
  
  key_name = "terra-keypair"

  subnet_id = aws_subnet.subnet_dev.id
  vpc_security_group_ids = [ aws_security_group.sg_dev.id ]

  tags = {
    Name = var.aws_ec2_name
  }
}
