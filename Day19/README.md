Terraform workspaces:

Terraform workspaces allow managing multiple environments using the same configuration by maintaining separate state files

Terraform workspaces commands:
| NAME                   | COMMAND |
| List workspaces        | terraform workspace list       |
| Create a workspace     | terraform workspace new dev    |
| Switch workspace       | terraform workspace select dev |
| Show current workspace | terraform workspace show       |
| Delete workspace       | terraform workspace delete dev |

------------------------------------------------------------------------------------------------------------------------

EC2 instance Name Tag:
    Name = "vm-${terraform.workspace}-${count.index}"

Network security group Name:
    name = "vpc-ssh-${terraform.workspace}

-------------------------------------------------------------------------------------------------------------------------

Example:
For non-default Workspaces, it may be useful to spin up smaller cluster sizes.
    count = terraform.workspace == "default" ? 2:1
#note: This will create 2 instance if we are in Default workspace and in any other workspace it will create 1 instance
OR
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = terraform.workspace == "prod" ? "t3.medium" : "t3.micro"
}
#note: prod → bigger instance, dev → smaller instance

-------------------------------------------------------------------------------------------------------------------------
