output "aws_public_ip" {
    description = "Public_ip"
    value = module.ec2_instance.public_ip
}

output "public_dns" {
    description = "Public_IP"
    value = [
        for dns in module.ec2_instance[*].public_dns :
        "http://${dns}"
    ]
}