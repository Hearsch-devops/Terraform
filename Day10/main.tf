resource "aws_instance" "aws_demo_ec2" {
    ami = var.aws_ec2_ami_id
    instance_type = var.aws_instance_type
    count = var.aws_count

    subnet_id = aws_subnet.aws_subnet_demo.id
    vpc_security_group_ids = [ aws_security_group.aws_sg_demo.id ]

    key_name = "terra-keypair"
    
    user_data = file("apache-install.sh")
   
    tags = {
      Name = "aws_demo_ec2-${count.index}"
    }
}
