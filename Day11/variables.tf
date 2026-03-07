variable "aws_region" {
  description = "providing aws region"
  type = string
  default = "us-east-1"
}

variable "aws_ami_id" {
  description = "providing ami id"
  type = string
  default = "ami-0ecb62995f68bb549"
}

variable "aws_ec2_type" {
  description = "providing ec2 instance type"
  type = string
  default = "t3.micro"
}


variable "aws_ec2_name" {
  description = "providing ec2 instance name"
  type = string
}