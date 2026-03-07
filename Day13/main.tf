resource "aws_instance" "custom-ec2" {
    ami = var.ec2_instance_ami_id
    instance_type = var.ec2_instance_type
    count = var.ec2_instance_count

    key_name = "terra-keypair.pem"

    subnet_id = aws_subnet.custom-subnet.id
    vpc_security_group_ids = [ aws_security_group.custom-sg.id ]

    user_data = file("apache-install.sh")

    tags = {
     Name = "custom-ec2" 
    }
  
}