#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
echo "Terraform Apache Test" > /var/www/html/index.html
