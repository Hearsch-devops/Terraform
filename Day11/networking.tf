#vpc
resource "aws_vpc" "vpc_dev" {
  cidr_block = "10.0.0.0/16"
}
#Internet gateway
resource "aws_internet_gateway" "gw_dev" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "gw_dev"
  }
}
#subnet
resource "aws_subnet" "subnet_dev" {
  vpc_id     = aws_vpc.vpc_dev.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_dev"
  }
}

#route table
resource "aws_route_table" "rt_dev" {
  vpc_id = aws_vpc.vpc_dev.id

}
#route
resource "aws_route" "r_dev" {
  route_table_id            = aws_route_table.rt_dev.id
  gateway_id = aws_internet_gateway.gw_dev.id
  destination_cidr_block = "0.0.0.0/0"
}
#route table association
resource "aws_route_table_association" "rta_dev" {
  #gateway_id = aws_internet_gateway.gw_dev.id
  subnet_id      = aws_subnet.subnet_dev.id
  route_table_id = aws_route_table.rt_dev.id
}
#security group
resource "aws_security_group" "sg_dev" {
  name        = "sg_dev"
  vpc_id      = aws_vpc.vpc_dev.id
  tags = {
    Name = "sg_dev"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg_dev.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg_dev.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_dev.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
