terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.32.1"
    }
  }
}

#provider region
provider "aws" {
  # Configuration options
  region = var.aws_region
}