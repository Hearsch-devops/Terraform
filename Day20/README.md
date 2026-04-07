# 🚀 Terraform Modules - Complete Guide

## 📌 What are Terraform Modules?

Terraform modules are **reusable blocks of infrastructure code** that help you organize, standardize, and reuse configurations.

Instead of writing the same code multiple times, you can create a module once and use it across different environments like **dev, staging, and production**.

---

## 🧱 Types of Modules

### 🔹 Root Module

* The main working directory where Terraform commands are executed.
* Contains:

  * `main.tf`
  * `variables.tf`
  * `outputs.tf`

---

### 🔹 Child Module

* A reusable module called from the root module.
* Stored in a separate directory (commonly inside `modules/`).

---

## 📂 Project Structure

```
terraform-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```
----
output.tf: 
output "aws_public_ip" {
  description = "Public IPs"
  value       = [for instance in module.ec2_instance : instance.public_ip]
}

output "public_dns" {
    description = "Public_IP"
    value = [
        for dns in module.ec2_instance[*].public_dns :
        "http://${dns}"
    ]
}
---

## ⚙️ Example: EC2 Module

### 📁 modules/ec2/main.tf

```hcl
resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}
```

---

### 📁 modules/ec2/variables.tf

```hcl
variable "ami" {}
variable "instance_type" {}
variable "name" {}
```

---

### 📁 modules/ec2/outputs.tf

```hcl
output "instance_id" {
  value = aws_instance.this.id
}
```

---

## 🔗 Calling the Module

### 📁 main.tf (Root Module)

```hcl
module "ec2_instance" {
  source = "./modules/ec2"

  ami           = "ami-12345678"
  instance_type = "t2.micro"
  name          = "my-ec2"
}
```

---

## 📤 Module Output Usage

```hcl
output "ec2_id" {
  value = module.ec2_instance.instance_id
}
```

---

## 🌍 Module Sources

Terraform modules can be sourced from:

### 🔹 Local Path

```hcl
source = "./modules/ec2"
```

### 🔹 Git Repository

```hcl
source = "git::https://github.com/user/repo.git//ec2"
```

### 🔹 Terraform Registry

```hcl
source  = "terraform-aws-modules/ec2-instance/aws"
version = "5.0.0"
```

---

## ✅ Benefits of Terraform Modules

* 🔁 Reusability — Write once, use multiple times
* 📏 Standardization — Consistent infrastructure
* 🧹 Clean Code — Organized and modular structure
* 👥 Team Collaboration — Share modules across teams

---

## 🧠 Best Practices

* Use **variables** instead of hardcoding values
* Define **outputs** for reusable data
* Follow **single responsibility principle** (one module per resource type)
* Use **versioning** for production modules
* Keep modules **simple and reusable**

---

## 🔥 Real-World Use Case

In a DevOps project, modules can be created for:

* VPC
* EC2
* RDS
* EKS
* Redis

These modules can then be reused across environments like:

* Development
* Staging
* Production

---

## 🎯 Interview Questions

### ❓ What is a Terraform module?

A reusable set of Terraform configuration files used to create infrastructure resources.

---

### ❓ Difference between root module and child module?

* Root module → Entry point where Terraform runs
* Child module → Reusable component called by root module

---

### ❓ Why use modules?

To improve reusability, maintainability, and consistency.

---

### ❓ Can modules be reused across projects?

Yes, using Git repositories or Terraform Registry.

---

### ❓ What is the Terraform Registry?

A public repository of reusable Terraform modules.

---

## 🚀 Conclusion

Terraform modules are **essential for real-world DevOps projects**. They help you build scalable, reusable, and production-ready infrastructure.

