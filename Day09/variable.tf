variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "aws_instance" {
    type = string
    default = "ami-0ecb62995f68bb549"  
}

variable "aws_count" {
    type = number
    default = 1
}
