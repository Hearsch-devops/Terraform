variable "aws_ec2_ami" {
    description = "providing AMI-ID for EC2"
    type = string
    default = "ami-0ecb62995f68bb549"
}

variable "aws_ec2_type" {
    description = "providing EC2 instance TYPE"
    type = string
    default = "t3.micro"  
}

variable "aws_region" {
    description = "providing aws region"
    type = string
    default = "us-east-1"  
}