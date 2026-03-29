resource "aws_instance" "aws_state" {
    ami = var.aws_ami
    instance_type = var.aws_type

    key_name = "terra-keypair"

    count = terraform.workspace == "default" ? 1:1

    user_data = file("apache-install.sh")

    subnet_id = aws_subnet.main.id
    vpc_security_group_ids = [ aws_security_group.sg_main.id ]

    tags = {
      Name = "vm-${terraform.workspace}-${count.index}"
    }
  
}