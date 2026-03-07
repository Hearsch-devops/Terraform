resource "aws_instance" "aws-count" {
    ami           = "ami-0b6c6ebed2801a5cb"
    instance_type = "t3.micro"
    user_data = file("apache-install.sh")
    count = 3

    tags = {
      #Name = "aws-count-demo"
      Name = "awscount-${count.index}"
    }
}