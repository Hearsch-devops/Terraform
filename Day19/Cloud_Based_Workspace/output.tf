output "Public_IP" {
  description = "Public_IP"
  value = aws_instance.aws_state.public_ip
}

output "public_dns" {
  description = "Public_IP"
  value = [
    for dns in aws_instance.aws_state[*].public_dns :
    "http://${dns}"
  ]
}