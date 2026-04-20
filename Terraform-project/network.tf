#vpc
resource "aws_vpc" "vpc_demo" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
  Name = "vpc_${terraform.workspace}"
  }
}

#subnet
resource "aws_subnet" "subnet_demo" {
  vpc_id     = aws_vpc.vpc_demo.id
  cidr_block = "10.0.1.0/24"
  
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_${terraform.workspace}"
  }
}

#ig
resource "aws_internet_gateway" "ig_demo" {
  vpc_id = aws_vpc.vpc_demo.id

  tags = {
    Name = "ig_${terraform.workspace}"
  }
}

#route table
resource "aws_route_table" "rt_demo" {
  vpc_id = aws_vpc.vpc_demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_demo.id
  }

  tags = {
    Name = "rt_${terraform.workspace}"
  }
}

#route table association
resource "aws_route_table_association" "rta_demo" {
  subnet_id      = aws_subnet.subnet_demo.id
  route_table_id = aws_route_table.rt_demo.id
}

#security group
resource "aws_security_group" "sg_demo" {
  name        = "sg__${terraform.workspace}"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.vpc_demo.id

  tags = {
    Name = "sg_${terraform.workspace}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg_demo.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg_demo.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_demo.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
