variable "aws_ec2_ami_id" {
    description = "providing ami id to ec2 instance"
    type = string
    default = "ami-0ecb62995f68bb549"  
}

variable "aws_ec2_instance_type" {
    description = "providing ec2 instance type"
    type = string
    default = "t3.micro"  
}

variable "aws_ec2_region" {
    description = "providing ec2 instance region"
    type = string
    default = "us-east-1"  
}

variable "aws_ec2_instance_count" {
    description = "providing ec2 instance count"
    type = number
    default = 2
}