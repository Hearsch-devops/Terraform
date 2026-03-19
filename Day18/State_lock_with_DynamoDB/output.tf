output "aws_public_ip" {
    description = "Public_IP"
    value = aws_instance.aws_s3.public_ip
}

output "aws_private_ip" {
  description = "Private_IP"
  value = aws_instance.aws_s3.private_ip
}

output "aws_public_dns" {
  description = "Public_DNS"
  value = "http://${aws_instance.aws_s3.public_dns}"
}
