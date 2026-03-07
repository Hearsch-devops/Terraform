#public ip
output "ec2_public_ip" {
    description = "public ip"
    value = aws_instance.ec2_demo[*].public_ip  
}

#private ip
output "ec2_private_ip" {
  description = "private ip"
  value = aws_instance.ec2_demo[*].private_ip
}

#public dns
output "ec2_public_dns" {
  description = "public dns"
  value = [for dns in aws_instance.ec2_demo[*].public_dns : "http://${dns}"]
}


#without count use http://${aws_instance.ec2_demo[*].public_dns}
#with count use [for dns in aws_instance.ec2_demo[*].public_dns : "http://${dns}"]