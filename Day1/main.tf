provider "aws" {
  region = "us-east-1"   # change to your region
}

resource "aws_instance" "my_ec2" {
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "t3.micro"
  key_name               = "terra-keypair"          # Your existing EC2 key pair name

  tags = {
    Name = "terraform-ec2"
  }
}
