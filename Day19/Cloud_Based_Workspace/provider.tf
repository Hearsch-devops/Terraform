terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }

  backend "s3" {
    bucket = "s3-terraform-statefile-dynamodb"
    key    = "statefile/terraform.state"
    region = "us-east-1"
    use_lockfile = true #new updated version directly use use_lockfile instead of dynamodb_table
    #dynamodb_table = "terraform-statefile-dynamodb" #old version
    #key = "statefile/${terraform.workspace}/terraform.tfstate" #This breaks default workspace behavior,Can conflict with workspace system,Not recommended with workspaces.
    #workspace_key_prefix = "Workspace" #to name your workspace in s3 backend. If not specifing prefix Terraform internally uses 'env' as default.
  }
}


provider "aws" {
  # Configuration options
  region = var.aws_region
}