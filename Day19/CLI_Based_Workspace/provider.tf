terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }

  /*backend "s3" {
    bucket = "s3-terraform-statefile-dynamodb"
    key    = "statefile/terraform.state"
    region = "us-east-1"
    #dynamodb_table = "terraform-statefile-dynamodb" #old version
    use_lockfile = true #new updated version directly use use_lockfile instead of dynamodb_table
  }*/

}


provider "aws" {
  # Configuration options
  region = var.aws_region
}