#vpc
resource "aws_vpc" "vpc_main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

#subnet
resource "aws_subnet" "subnet_main" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_main"
  }
}

#ig
resource "aws_internet_gateway" "ig_main" {
  vpc_id = aws_vpc.vpc_main.id
  tags = {
    Name = "ig_main"
  }
}
#route table
resource "aws_route_table" "rt_main" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_main.id
  }

  tags = {
    Name = "rt_main"
  }
}
#route table association
resource "aws_route_table_association" "rta_main" {
  subnet_id      = aws_subnet.subnet_main.id
  route_table_id = aws_route_table.rt_main.id
}
#security group
resource "aws_security_group" "sg_main" {
  name        = "sg_main"
  description = "Allow ALL inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_main.id

  tags = {
    Name = "sg_main"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg_main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg_main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
