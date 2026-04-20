resource "aws_instance" "aws_demo" {
    # EC2 instance details
    ami             = var.aws_ami_id
    instance_type   = var.instance_type
    count           = var.aws_count
    # key pair
    key_name        = "terra-keypair"

    # web-server
    user_data       = file("apache-install.sh")

    # vpc details
    subnet_id       = aws_subnet.subnet_demo.id
    vpc_security_group_ids = [ aws_security_group.sg_demo.id ]

    # aws instance name
    tags = {
      Name = "ec2_${terraform.workspace}_server"
    }
}