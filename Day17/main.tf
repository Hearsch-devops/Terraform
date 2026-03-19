resource "aws_instance" "aws_ds" {
    # ec2 instance details
    ami = data.aws_ami.aws_ds.id
    instance_type = var.aws_instance_type

    #apache web server
    user_data = file("apache-install.sh")

    #key pair
    key_name = "terra-keypair"

    #vpc
    subnet_id = aws_subnet.subnet_ds.id
    vpc_security_group_ids = [ aws_security_group.sg_ds.id ]

    #aws name
    tags = {
      Name ="aws_ds"
    }


}