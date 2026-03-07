resource "aws_instance" "aws-main" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subnet-main.id
  vpc_security_group_ids = [ aws_security_group.sg-main.id ]
  user_data = file("apache-install.sh")
  tags = {
    Name = "apache2-demo"
  }
}