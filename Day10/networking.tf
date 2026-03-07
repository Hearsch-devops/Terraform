#vpc
#subnet
#ig
#route table
#route
#route table association
#security group

#vpc
resource "aws_vpc" "aws_vpc_demo" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "aws_vpc_demo"
  }
}

#subnet
resource "aws_subnet" "aws_subnet_demo" {
  vpc_id     = aws_vpc.aws_vpc_demo.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "aws_subnet_demo"
  }
}

#ig
resource "aws_internet_gateway" "aws_gw_demo" {
  vpc_id = aws_vpc.aws_vpc_demo.id

  tags = {
    Name = "aws_gw_demo"
  }
}

#route table
resource "aws_route_table" "aws_rt_demo" {
  vpc_id = aws_vpc.aws_vpc_demo.id

  tags = {
    Name = "aws_rt_demo"
  }
}

#route
resource "aws_route" "aws_rt_demo" {
  route_table_id            = aws_route_table.aws_rt_demo.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.aws_gw_demo.id

}

#route table association
resource "aws_route_table_association" "aws_rta_demo" {
  subnet_id      = aws_subnet.aws_subnet_demo.id
  route_table_id = aws_route_table.aws_rt_demo.id
}

#security group
resource "aws_security_group" "aws_sg_demo" {
  name        = "aws_sg_demo"
  vpc_id      = aws_vpc.aws_vpc_demo.id

  tags = {
    Name = "aws_sg_demo"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.aws_sg_demo.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.aws_sg_demo.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_inbound_traffic" {
  security_group_id = aws_security_group.aws_sg_demo.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
