resource "aws_instance" "aws-count" {
    ami           = "ami-0b6c6ebed2801a5cb"
    instance_type = "t3.micro"
    user_data = file("apache-install.sh")
    subnet_id = aws_subnet.subnet-count.id
    vpc_security_group_ids = [ "aws_security_group.sg-count.id" ]
    key_name = "terra-keypair"
    count = 2

    tags = {
      #Name = "aws-count-demo"
      Name = "awscount-${count.index}"
    }
}
