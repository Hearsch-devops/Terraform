#VPC 
#Subnet 
#Internet Gateway 
#Route Table
#Route
#Route Table Association 
#Security Group

#VPC
resource "aws_vpc" "vpc-count" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "vpc-count"
  }
}

#SUBNET
resource "aws_subnet" "subnet-count" {
  vpc_id     = aws_vpc.vpc-count.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-count"
  }
}

#INTERNET GATEWAY
resource "aws_internet_gateway" "gw-count" {
  vpc_id = aws_vpc.vpc-count.id

  tags = {
    Name = "gw-count"
  }
}

#ROUTETABLE
resource "aws_route_table" "rt-count" {
  vpc_id = aws_vpc.vpc-count.id

  tags = {
    Name = "rt-count"
  }
}

#ROUTE
resource "aws_route" "main-route" {
  route_table_id = aws_route_table.rt-count.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw-count.id

}

#ROUTETABLEASSOCIATION
resource "aws_route_table_association" "art-count" {
  route_table_id = aws_route_table.rt-count.id
  subnet_id = aws_subnet.subnet-count.id
}

#SECURITYGROUP
resource "aws_security_group" "sg-count" {
  name        = "allow_traffic"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-count.id

  tags = {
    Name = "sg-count"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg-count.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg-count.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg-count.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
