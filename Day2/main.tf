resource "aws_instance" "ec2demo" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"

    tags = {
      Name = "ec2demo"
    }
}
