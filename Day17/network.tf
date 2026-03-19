#vpc
resource "aws_vpc" "vpc_ds" {
  cidr_block = "10.0.0.0/16"
}

#subnet
resource "aws_subnet" "subnet_ds" {
  vpc_id     = aws_vpc.vpc_ds.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_ds"
  }
}

#ig
resource "aws_internet_gateway" "ig_ds" {
  vpc_id = aws_vpc.vpc_ds.id

  tags = {
    Name = "ig_ds"
  }
}

#route table
resource "aws_route_table" "rt_ds" {
  vpc_id = aws_vpc.vpc_ds.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_ds.id
  }


  tags = {
    Name = "rt_ds"
  }
}

#route table association
resource "aws_route_table_association" "rta_ds" {
  subnet_id      = aws_subnet.subnet_ds.id
  route_table_id = aws_route_table.rt_ds.id
}

#security group
resource "aws_security_group" "sg_ds" {
  name        = "sg_ds"
  description = "Allow ALL inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_ds.id

  tags = {
    Name = "sg_ds"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg_ds.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg_ds.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_ds.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
