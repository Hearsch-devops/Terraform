terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

# Default provider (us-east-1)
provider "aws" {
  region = "us-east-1"
  profile = "default"
}
resource "aws_vpc" "demo_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "demo_vpc"
    }
}

# Oregon provider (alias)
provider "aws" {
  alias  = "oregon"
  region = "us-west-2"
  profile = "default"  
}
resource "aws_vpc" "oregon_vpc" {
    provider = aws.oregon
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "oregon_vpc"
    } 
}
