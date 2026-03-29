#vpc
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
   Name = "vpc-${terraform.workspace}" 
  }
}
#ig
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-${terraform.workspace}"
  }
}
#subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Main-${terraform.workspace}"
  }
}
#route table
resource "aws_route_table" "rt_main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "rt_main-${terraform.workspace}"
  }
}
#associate route table
resource "aws_route_table_association" "art_main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.rt_main.id
}
#security group
resource "aws_security_group" "sg_main" {
  name        = "sg_main"
  description = "Allow ALL inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "sg_main-${terraform.workspace}"
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
