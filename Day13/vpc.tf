#vpc
resource "aws_vpc" "custom-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

#subnet
resource "aws_subnet" "custom-subnet" {
  vpc_id     = aws_vpc.custom-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "custom-subnet"
  }
}

#ig
resource "aws_internet_gateway" "custom-gw" {
  vpc_id = aws_vpc.custom-vpc.id

  tags = {
    Name = "custom-gw"
  }
}

#route table
resource "aws_route_table" "custom-rt" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom-gw.id
  }

  tags = {
    Name = "custom-rt"
  }
}

#route table association
resource "aws_route_table_association" "custom-rta" {
  subnet_id      = aws_subnet.custom-subnet.id
  route_table_id = aws_route_table.custom-rt.id
}

#security group
resource "aws_security_group" "custom-sg" {
  name        = "custom-sg"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.custom-vpc.id

  tags = {
    Name = "custom-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.custom-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.custom-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.custom-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}