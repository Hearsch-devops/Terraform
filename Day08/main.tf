
#lifecycle using create_before_destroy
resource "aws_instance" "demo-web" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"
    #availability_zone = "us-east-1a"
    #availability_zone = "us-east-1b"

    tags = {
      Name = "web1"
    }

    lifecycle {
      create_before_destroy = true
    }
  
}

#lifecycle using prevent_destroy
/*
lifecycle {
  prevent_destroy = true
}
*/

#lifecycle using ignore_changes
/*
lifecycle {
  ignore_changes = [
    tags
  ]
}
*/

