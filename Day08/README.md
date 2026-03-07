Terraform Lifecycle Meta-Argument
Overview
The lifecycle block in Terraform is used to control how resources are created, updated, and destroyed.
It allows you to modify Terraform's default behavior when managing infrastructure.

The lifecycle block is defined inside a resource block.

Basic Syntax
resource "aws_instance" "demo-web" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"

  tags = {
    Name = "web-demo"
  }

  lifecycle {
    create_before_destroy = true
  }
}
==========================================================================================
Lifecycle Arguments
1. create_before_destroy
Description
Ensures Terraform creates a new resource first and then destroys the old one when replacement is required.

Example
lifecycle {
  create_before_destroy = true
}

Use Case
Avoid downtime when replacing resources such as:
EC2 instances
Load balancers
Application servers

2. prevent_destroy
Description
Prevents Terraform from accidentally destroying a resource.

Example
lifecycle {
  prevent_destroy = true
}
Use Case
Used for critical resources such as:
Production databases
S3 buckets containing important data

If someone runs:
terraform destroy

Terraform will throw an error and stop the operation.

3. ignore_changes
Description

Tells Terraform to ignore changes to specific attributes of a resource.

Example
lifecycle {
  ignore_changes = [tags]
}

Use Case
Useful when external systems modify resources, such as:
Auto-scaling policies
Manual tag updates
Monitoring tools

4. replace_triggered_by
Description
Forces resource replacement when another resource changes.

Example
lifecycle {
  replace_triggered_by = [
    aws_security_group.web_sg.id
  ]
}
Use Case
Ensures dependent resources are recreated when related resources change.

============================================================================================
Interview Questions
1️⃣ What is the lifecycle block in Terraform?
The lifecycle block controls how Terraform manages resource creation, updates, and deletion.

2️⃣ What does create_before_destroy do?
It ensures Terraform creates the new resource first before destroying the old one.

3️⃣ What is prevent_destroy?
A lifecycle rule that prevents accidental deletion of critical resources.

4️⃣ What does ignore_changes do?
It tells Terraform to ignore changes made outside Terraform for specific attributes.

5️⃣ What is replace_triggered_by?
It forces resource replacement when another resource changes.

6️⃣ Does create_before_destroy always prevent downtime?
No. It is a best-effort setting and may fail if there are dependency conflicts or resource limitations.

7️⃣ What are ForceNew attributes in Terraform?
Attributes that require resource replacement when modified.
Examples:
AMI
Subnet
Availability zone

8️⃣ Difference between in-place update and resource replacement?
Type	Behavior
In-place update	Resource updated without destruction
Replacement	Old resource destroyed and new resource created

Important Notes
Lifecycle rules only apply when resource replacement is required.
create_before_destroy is a best-effort setting and may not always work if there are dependency conflicts.
Some attributes in Terraform are marked ForceNew, which always trigger resource replacement.