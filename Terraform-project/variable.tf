variable "aws_region" {
    description = "providing aws region"
    type = string
    default = "us-east-1"
  
}

variable "aws_ami_id" {
    description = "providing aws ami id"
    type = string
    default = "ami-0ecb62995f68bb549"
  
}

variable "instance_type" {
    description = "providing aws instance type"
    type = string
    default = "t3.micro"
  
}

variable "aws_count" {
    description = "AWS count"
    type = number
    default = "2"
  
}