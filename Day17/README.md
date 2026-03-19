terraform Datasources link:
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

Terraform Datasources introduction

Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration.

Use of data sources allows a Terraform configuration to make use of information defined outside of Terraform, or defined by another separate Terraform configuration.

A data source is accessed via a special kind of resource known as a data resource, declared using a data block

Each data resource is associated with a single data source, which determines the kind of object (or objects) it reads and what query constraint arguments are available

Data resources have the same dependency resolution behavior as defined for managed resources. Setting the depends_on meta-
argument within data blocks defers reading of the data source until after all changes to the dependencies have been applied.

Meta-Arguments for Datasources:
Data resources support the provider meta-argument as defined for managed resources, with the same syntax and behavior.

Data resources do not currently have any customization settings available for their lifecycle, but the lifecycle nested block is reserved in case any are added in future versions.

Data resources support count and for_each meta-arguments as defined for managed resources, with the same syntax and
behavior.
Each instance will separately read from its data source with its own variant of the constraint arguments, producing an indexed result.

Key Difference
| OS           | Owner            |
| ------------ | ---------------- |
| Amazon Linux | `"amazon"`       |
| Ubuntu       | `"099720109477"` |

Reason:
Amazon Linux → owned by AWS
Ubuntu → owned by Canonical AWS account

Name Pattern Difference:
| OS           | Pattern                                                       |
| ------------ | ------------------------------------------------------------- |
| Ubuntu       | `ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*` |
| Amazon Linux | `amzn2-ami-hvm-*-x86_64-gp3`                                  |

Best Practice DevOps Engineers Use
Always include:
most_recent = true
owners
architecture
virtualization-type
This prevents Terraform from selecting the wrong AMI.

basic configuration:
Ubuntu AMI
owners = ["099720109477"]

filter {
  name   = "name"
  values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
}
------------------------------------------------------------------------------
Amazon Linux AMI
owners = ["amazon"]

filter {
  name   = "name"
  values = ["amzn2-ami-hvm-*-gp3"]
}

How to Verify the Real Owner:
aws ec2 describe-images \
--image-ids ami-0b6c6ebed2801a5cb \
--query 'Images[*].[ImageId,OwnerId,Name]'

Interview Tip
Q: Why do we use most_recent = true in aws_ami data source?
Answer:
It ensures Terraform automatically selects the latest available AMI matching the filters, avoiding hardcoded AMI IDs.