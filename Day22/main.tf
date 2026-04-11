resource "aws_instance" "ec2_demo" {
  ami = var.aws_ami_id
  instance_type = var.aws_type
  
  key_name = "terra-keypair"

  user_data = file("apache-install.sh")

  subnet_id = aws_subnet.subnet_terrfa_cloud.id
  vpc_security_group_ids = [ aws_security_group.sg_terrfa_cloud.id ]

  tags = {
    Name = ec2_cloud
  }
}