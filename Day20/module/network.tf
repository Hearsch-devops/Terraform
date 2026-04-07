#vpc
resource "aws_vpc" "module_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
   Name = "module_vpc" 
  }
}
#subnet
resource "aws_subnet" "module_subnet" {
  vpc_id     = aws_vpc.module_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "module_subnet"
  }
}
#ig
resource "aws_internet_gateway" "module_ig" {
  vpc_id = aws_vpc.module_vpc.id

  tags = {
    Name = "module_ig"
  }
}
#route table
resource "aws_route_table" "module_rt" {
  vpc_id = aws_vpc.module_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.module_ig.id
  }

  tags = {
    Name = "module_rt"
  }
}
#associate route table
resource "aws_route_table_association" "module_art" {
  subnet_id      = aws_subnet.module_subnet.id
  route_table_id = aws_route_table.module_rt.id

}
#security group
resource "aws_security_group" "module_sg" {
  name        = "module_sg"
  description = "Allow ALL inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.module_vpc.id

  tags = {
    Name = "module_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.module_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.module_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.module_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
