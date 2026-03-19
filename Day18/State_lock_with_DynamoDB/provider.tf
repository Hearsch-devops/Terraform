
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }
  backend "s3" {
    bucket = "s3-terraform-statefile-dynamodb"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-statefile-dynamodb"
  }
}

provider "aws" {
  region = var.aws_region
}



# DynamoDB is used for state locking in Terraform.Prevents multiple users/pipelines from modifying state at the same time
