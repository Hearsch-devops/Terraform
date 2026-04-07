variable "aws_region" {
    description = "providing AWS REGION"
    type = string
    default = "us-east-1"
}

variable "website" {
    description = "terraform static website"
    type = string
    default = "terraform-s3-bucket-static-website-html"
}

