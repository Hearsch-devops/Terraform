#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
echo "Apache-Webserver Test through Terraform" > /var/www/html/index.html
