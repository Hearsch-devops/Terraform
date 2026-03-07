resource "aws_instance" "ec2demo"   {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "EC2-Demo-Instance"
  }
}