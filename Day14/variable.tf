variable "ec2_instance_ami_id" {
    description = "providing ami id"
    type = string
    default = "ami-0ecb62995f68bb549"

}

variable "ec2_instance_type" {
    description = "providing ec2 instance type"
    type = string
    default = "t3.micro"
 
}

variable "ec2_intance_region" {
    description = "providing ec2 instance region"
    type = string
    default = "us-east-1"

}

