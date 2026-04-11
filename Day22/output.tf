output "aws_public_IP" {
  description = "PUBLIC_IP"
  value = aws_instance.ec2_demo.public_ip
}

output "aws_public_dns" {
  description = "AWS_PUBLIC_DNS"
  value = [
    for dns in aws_instance.aws_instance.ec2_demo[*].public_dns :
    "http://${dns}"
  ]
}