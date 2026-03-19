# Terraform State

## Overview

Terraform uses a **state file (`terraform.tfstate`)** to store information about the infrastructure it manages.
This file maps Terraform configuration to real-world resources such as AWS EC2, S3, VPC, etc.

Terraform uses the state file to:

* Track created resources
* Detect configuration changes
* Plan infrastructure updates
* Avoid recreating existing resources

---

## Common Terraform State Commands

### List Resources in State

```bash
terraform state list
```

Shows all resources currently tracked in the Terraform state.

---

### Show Resource Details

```bash
terraform state show <resource_name>
```

Example:

```bash
terraform state show aws_instance.web
```

Displays detailed information about a specific resource.

---

### Move a Resource in State

```bash
terraform state mv <source> <destination>
```

Example:

```bash
terraform state mv aws_instance.old aws_instance.new
```

Used when renaming resources without recreating them.

---

### Remove Resource from State

```bash
terraform state rm <resource_name>
```

Example:

```bash
terraform state rm aws_instance.web
```

Removes the resource from Terraform state **without deleting the actual infrastructure**.

---

### Pull Remote State

```bash
terraform state pull
```

Downloads the current remote state.

---

### Push State to Remote Backend

```bash
terraform state push terraform.tfstate
```

---

## Example Terraform Resource

```hcl
resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = "t3.micro"
}
```

After running:

```bash
terraform apply
```

Terraform stores the infrastructure information in **terraform.tfstate**.

---

## Interview Questions

**1. What is Terraform State?**
Terraform state is a file that stores the mapping between Terraform configuration and real infrastructure resources.

**2. Why is Terraform state important?**
It allows Terraform to track resources and determine what changes need to be applied.

**3. What does `terraform state rm` do?**
It removes a resource from the state file without deleting the actual resource.

**4. What is `terraform state mv` used for?**
It moves or renames a resource in the Terraform state without recreating it.

---

## Best Practice

Do not store `terraform.tfstate` in Git.
Use a **remote backend (S3, Terraform Cloud, etc.)** to store the state securely.
