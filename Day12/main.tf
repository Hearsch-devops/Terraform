/*
resource "aws_instance" "aws_demo" {
    ami = var.aws_ami_id
    instance_type = var.aws_instance_type

    tags = {
      Name = "aws_demo"
    }
}
*/

/*
#Input Variables - Complex Constructor of Type List
resource "aws_instance" "aws_demo" {
    ami = var.aws_ami_id
    instance_type = var.aws_instance_type[1]

    tags = {
      Name = "aws_demo"
    }
}
*/

#Input Variables - Complex Constructor of Type Map
resource "aws_instance" "aws_demo" {
    ami = var.aws_ami_id
    instance_type = var.aws_instance_type["large-apps"]

    tags = {
      Name = "aws_demo"
    }
}