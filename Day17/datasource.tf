data "aws_ami" "aws_ds" {
  #executable_users = ["self"]
  most_recent      = true
  #name_regex       = "^myami-[0-9]{3}"
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture-type"
    values = ["x86_64"]
  }
}