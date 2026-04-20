# Public IPs
output "aws_public_ip" {
  description = "Public_IP"
  value       = aws_instance.aws_demo[*].public_ip
}

# Public DNS
output "app_url" {
  description = "Application URL"
  value = [
    for dns in aws_instance.aws_demo[*].public_dns :
    "http://${dns}"
  ]
}
