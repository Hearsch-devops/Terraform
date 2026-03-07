resource "aws_instance" "ec2demo" {
    ami = var.aws_instance
    instance_type = "t3.micro"
    count = var.aws_count

    subnet_id = aws_subnet.aws_subnet.id
    vpc_security_group_ids = [ aws_security_group.aws_sg.id ]

    user_data = file("apache-install.sh")

    key_name = "terra-keypair"

    tags = {
        Name = "ec2demo"
    }
}

