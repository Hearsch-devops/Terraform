resource "aws_instance" "ec2_demo" {
    #instance details
    ami = var.aws_ec2_ami_id
    count = var.aws_ec2_instance_count[*]
    instance_type = var.aws_ec2_instance_type

    #apache web server
    user_data = file("apache-install.sh")

    #vpc details
    subnet_id = aws_subnet.subnet_main.id
    vpc_security_group_ids = [ aws_security_group.sg_main.id ]
    
    #key pair
    key_name = "terra-keypair"

    #tags
    tags = {
     Name = "ec2_demo-${count.index}"
    }  
}
