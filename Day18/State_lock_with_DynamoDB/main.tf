resource "aws_instance" "aws_s3" {
    ami = var.aws_ami
    instance_type = var.aws_type

    user_data = file("apache-install.sh")
    key_name = "terra-keypair"

    subnet_id = aws_subnet.subnet_s3.id
    vpc_security_group_ids = [ aws_security_group.sg_s3.id ]

    tags = {
      Name = "aws_s3"
    }
  
}
