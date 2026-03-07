#vpc
resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.0.0.0/16"
}

#subnet
resource "aws_subnet" "aws_subnet" {
  vpc_id     = aws_vpc.aws_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "aws_subnet"
  }
}

#internet_gateway
resource "aws_internet_gateway" "aws_gw" {
  vpc_id = aws_vpc.aws_vpc.id

  tags = {
    Name = "aws_gw"
  }
}

#route_table
resource "aws_route_table" "aws_rt" {
  vpc_id = aws_vpc.aws_vpc.id
  
  tags = {
    Name = "aws_rt"
  }
}

#aws_route
resource "aws_route" "aws_r" {
  route_table_id = aws_route_table.aws_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.aws_gw.id
}

#route_table_association
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.aws_subnet.id
  #gateway_id = aws_internet_gateway.aws_gw.id
  route_table_id = aws_route_table.aws_rt.id
}

#security_group
resource "aws_security_group" "aws_sg" {
  vpc_id = aws_vpc.aws_vpc.id
  tags = {
    Name = "sg_var"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.aws_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  }

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.aws_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  }


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.aws_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
