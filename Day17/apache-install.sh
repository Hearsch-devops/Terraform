#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
echo "Terraform AWS Infrastructure Deployment with Apache Web Server" > /var/www/html/index.html