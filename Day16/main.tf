#creating s3 bucket with input variable & local values
#Using locals avoids repeating the same expression multiple times and improves maintainability.

resource "random_id" "random_id" {
  byte_length = 2
}

locals {
  bucket_name = lower (format( "%s-%s-bucket-%s", var.app_name, var.environment_name, random_id.random_id.hex ))
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = local.bucket_name
  tags = {
   Name = local.bucket_name
   Environment = var.environment_name
  }
}


#creating s3 bucket with input variable
/*
resource "aws_s3_bucket" "mys3bucket" {
    bucket = "${var.s3_app_name}-${var.environment_name}-bucket" 
    tags = {
     Name = "${var.s3_app_name}-${var.environment_name}-bucket" 
     Environment = var.environment_name
    }
}
*/
