variable "ec2_instance_ami_id" {
    description = "providing AMI ID"
    type = string
    default = "ami-0ecb62995f68bb549"

    validation {
      condition = length(var.ec2_instance_ami_id) > 4 && substr(var.ec2_instance_ami_id) == "ami-"
      error_message = "Enter valid AMI-ID"
    }
  
}

variable "ec2_instance_type" {
    description = "providing ec2 instance type"
    type = string
    default = "t3.micro"
    validation {
      condition = contains (["t3.micro", "t3.small"], var.ec2-instance-type)
      error_message = "Enter valid instance type"
    }
  
}

variable "ec2_instance_count" {
    description = "providing number of instance"
    type = number
    default = 1
  
}

variable "ec2_intance_region" {
    description = "providing ec2 instance region"
    type = string
    default = "us-east-1"
    validation {
      condition = contains (["us-east-1"], var.ec2-instance-region)
      error_message = "Enter Valid Region"
    }
}

