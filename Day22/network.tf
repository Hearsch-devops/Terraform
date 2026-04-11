#vpc
resource "aws_vpc" "vpc_terrfa_cloud" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}
#subnet
resource "aws_subnet" "subnet_terrfa_cloud" {
  vpc_id     = aws_vpc.vpc_terrfa_cloud.id
  cidr_block = "10.0.1.0/24"

  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_terrfa_cloud"
  }
}
#ig
resource "aws_internet_gateway" "ig_terrfa_cloud" {
  vpc_id = aws_vpc.vpc_terrfa_cloud.id

  tags = {
    Name = "ig_terrfa_cloud"
  }
}
#route table
resource "aws_route_table" "rt_terrfa_cloud" {
  vpc_id = aws_vpc.vpc_terrfa_cloud.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_terrfa_cloud.id
  }

  tags = {
    Name = "rt_terrfa_cloud"
  }
}
#associate route table
resource "aws_route_table_association" "art_terrfa_cloud" {
  subnet_id      = aws_subnet.subnet_terrfa_cloud.id
  route_table_id = aws_route_table.rt_terrfa_cloud.id
}
#security group
resource "aws_security_group" "sg_terrfa_cloud" {
  name        = "sg_terrfa_cloud"
  description = "Allow ALL inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_terrfa_cloud.id

  tags = {
    Name = "sg_terrfa_cloud"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg_terrfa_cloud.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg_terrfa_cloud.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
