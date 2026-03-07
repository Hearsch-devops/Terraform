#create EC2 instance ami id
variable "aws_ec2_ami_id" {
    description = "creating aws ec2 instance ami id"
    type = string
    default = "ami-0ecb62995f68bb549"
  
}

#specify aws instance type
variable "aws_instance_type" {
    description = "specifying ami id for ec2 instance"
    type = string
    default = "t3.micro"
  
}

#create number of instance using count
variable "aws_count" {
    description = "creating number of ec2 instance using count"
    type = number
    default = "2"
  
}

#specify aws region
variable "aws_region" {
    description = "specifying region "
    type = string
    default = "us-east-1"
  
}
