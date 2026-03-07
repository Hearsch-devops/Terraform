Without Count 
Created an output.tf file to display important information about the EC2 instance after Terraform provisions the infrastructure.

Outputs Created:
The following outputs are defined:
ec2_public_ip – Displays the public IP address of the EC2 instance.
ec2_private_ip – Displays the private IP address of the EC2 instance.
ec_public_dns – Displays the public DNS of the EC2 instance with http:// prefix for easy browser access.

Purpose:
Output variables help retrieve useful resource information such as IP addresses and DNS names after infrastructure deployment.