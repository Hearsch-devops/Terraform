#public ip
output "ec2_public_ip" {
    description = "public ip"
    value = aws_instance.custom-ec2.public_ip
  
}

#private ip
output "ec2_private_ip" {
  description = "private ip"
  value = aws_instance.custom-ec2.private_ip
}

#public dns
output "ec_public_dns" {
  description = "public dns"
  value = "http://${aws_instance.custom-ec2.public_dns}"
}