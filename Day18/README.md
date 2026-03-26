# 🚀 Terraform State & State Commands Guide

## 📌 What is Terraform State?

Terraform state is a file (`terraform.tfstate`) that stores the mapping between your **Terraform configuration** and the **real infrastructure** (AWS, Azure, etc.).

### 🔑 Why State is Important

Terraform uses the state file to:
- Track resources it created
- Detect changes (drift detection)
- Plan updates efficiently
- Map configuration to real-world infrastructure

Without the state file, Terraform **cannot understand what already exists**.

---

## 📂 Types of State

### 1. Local State
- Stored locally (`terraform.tfstate`)
- Not suitable for teams

### 2. Remote State
- Stored in backend (e.g., S3)
- Supports:
  - Collaboration
  - Locking
  - Versioning

---

## 🔐 State Locking

Prevents multiple users from modifying infrastructure at the same time.

### Options:
- `use_lockfile = true` (S3 native locking - modern)
- DynamoDB (older method)

---

## 🛠️ Terraform State Commands

| Command                            | Purpose               |
| ------------------ ----------------| --------------------- |
| `terraform state list`             | Show all resources    |
| `terraform state show`             | Show resource details |
| `terraform state mv`               | Rename/move resource  |
| `terraform state rm`               | Remove from state     |
| `terraform state pull`             | Download state        |
| `terraform state push`             | Upload state          |
| `terraform state replace-provider` | Change provider       |
| `terraform apply -replace`         | Recreates instance with SAME config | #note: terraform apply -var="instance-type=t3.micro" - configuration change
