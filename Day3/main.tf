resource "aws_instance" "ec2demo" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"
    tags = {
      Name = "ec2demo"
    }
}

resource "aws_instance" "ec2_oregon" {
    provider = aws.oregon
    ami = "ami-00f46ccd1cbfb363e"
    instance_type = "t3.micro"
    tags = {
      Name = "ec2_oregon"
    }
}

#Creating Multiple providers
