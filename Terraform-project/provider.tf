terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }

  backend "s3" {
    bucket = "s3-terraform-statefile-489364174245-us-east-1-an"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    #encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}