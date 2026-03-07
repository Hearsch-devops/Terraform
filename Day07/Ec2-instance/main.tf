#using for-each to create multiple ec2 instance
resource "aws_instance" "web" {
  ami = "ami-0ecb62995f68bb549"
  for_each      = var.instance
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
