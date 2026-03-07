# Resource Block
# Resource-1: Create VPC
resource "aws_vpc" "vpc-main" {
  cidr_block       = "10.0.0.0/16"
  
  tags = {
    Name = "vpc-main"
  }
}
# Resource-2: create Subnet
resource "aws_subnet" "subnet-main" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-main"
  }
}
# Resource-3: create Internet Gateway
resource "aws_internet_gateway" "gw-main" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    Name = "gw-main"
  }
}
# Resource-4: create Route Table
resource "aws_route_table" "rt-main" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    Name = "rt-main"
  }
}
# Resource-5: create Route in Route Table for Internet Gateway
resource "aws_route" "main-route" {
  route_table_id = aws_route_table.rt-main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw-main.id

}
# Resource-6: Associate the Route Table with the Subnet.
resource "aws_route_table_association" "rts-main" {
    route_table_id = aws_route_table.rt-main.id
    subnet_id = aws_subnet.subnet-main.id
  
}
# Resource-7: create Security Group
resource "aws_security_group" "sg-main" {
  name        = "sgmain"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.vpc-main.id

  tags = {
    Name = "sg-main"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  security_group_id = aws_security_group.sg-main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow-http" {
  security_group_id = aws_security_group.sg-main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg-main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


resource "aws_eip" "lb-main" {
  instance = aws_instance.aws-main.id
  depends_on = [ aws_internet_gateway.gw-main ]

  tags = {
    Name = "lb-main"
  }

}