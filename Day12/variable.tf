/*
#basic variable 
#aws region
variable "aws_region" {
  description = "providing aws region"
  type = string
  default = "us-east-1"
}

#aws ec2 instance type
variable "aws_instance_type" {
    description = "providing ec2 instance type"
    type = string
    default = "t3.micro"
  
}

#aws ec2 ami Id
variable "aws_ami_id" {
    description = "providing ec2 instance ami id"
    type = string
    default = "ami-0ecb62995f68bb549"
  
}
*/

/*
#Input Variables - Complex Constructor of Type List
variable "aws_region" {
  description = "providing aws region"
  type = string
  default = "us-east-1"
}

#aws ec2 instance type
variable "aws_instance_type" {
    description = "providing ec2 instance type"
    type = list(string)
    default = ["t3.micro", "t3.small", "t3.large"]
  
}

#aws ec2 ami Id
variable "aws_ami_id" {
    description = "providing ec2 instance ami id"
    type = string
    default = "ami-0ecb62995f68bb549"
  
}
*/

#Input Variables - Complex Constructor of Type Map
variable "aws_region" {
  description = "providing aws region"
  type = string
  default = "us-east-1"
}

#aws ec2 instance type
variable "aws_instance_type" {
    description = "providing ec2 instance type"
    type = map(string)
    
    default = {
      "micro-apps" = "t3.micro" 
      "small-apps" = "t3.small"
      "large-apps" = "t3.large"
    }
  
}

#aws ec2 ami Id
variable "aws_ami_id" {
    description = "providing ec2 instance ami id"
    type = string
    default = "ami-0ecb62995f68bb549"
  
}