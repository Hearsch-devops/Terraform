output "aws_public_ip" {
  description = "getting public_ip"
  value = aws_instance.aws_ds.public_ip
}

output "aws_private_ip" {
    description = "getting private_ip"
    value = aws_instance.aws_ds.private_ip
}

output "aws_public_dns" {
  description = "getting public_dns"
  value = "http://${aws_instance.aws_ds.public_dns}"
}