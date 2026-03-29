variable "aws_region" {
    description = "providing aws region"
    type = string
    default = "us-east-1"
  
}

variable "aws_ami" {
    description = "providing aws ami id"
    type = string
    default = "ami-0ecb62995f68bb549"
  
}

variable "aws_type" {
    description = "providing aws ec2 instance type"
    type = string
    default = "t3.micro"
  
}
