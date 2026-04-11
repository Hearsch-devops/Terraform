Terraform Cloud + AWS EC2 Deployment
📌 Project Overview

This project demonstrates how to provision an AWS EC2 instance using Terraform Cloud (app.terraform.io) with a remote VCS-driven workflow.

It includes:
Terraform Cloud workspace setup
AWS provider configuration
Secure credential handling via environment variables
EC2 instance provisioning with custom user data

Terraform Cloud Setup
Workspace Configuration
Connect GitHub repository
Working Directory: (leave empty if files are in root)

How to Run
Push code to GitHub
Connect repo to Terraform Cloud
Add variables and credentials
Click Queue Plan
Apply changes

Terraform Cloud
Remote State (managed by Terraform Cloud)
Benefits:
Auto versioning
State locking
Team collaboration

Team Collaboration
🔹Local
Manual sharing
Conflicts possible
No visibility
Team-based workflows
Run history
UI visibility
Role-based access

Automation / CI-CD
🔹 Local
Need Jenkins / GitLab CI manually
☁️ Terraform Cloud
Built-in VCS integration
Auto trigger on commit

Security Level
| Feature          | Local      | Terraform Cloud    |
| ---------------- | --------   | ---------------    |
| Secrets          | ❌ weak   | ✅ secure          |
| State encryption | ❌ manual | ✅ automatic       |
| Access control   | ❌ none   | ✅ RBAC            |


Interview
Difference between Terraform and Terraform Cloud?
Answer:
Terraform runs locally, Terraform Cloud runs remotely
Terraform Cloud provides remote state, locking, and collaboration
It integrates with VCS for automated workflows
It manages secrets securely via environment variables

terraform cloud link: https://app.terraform.io/

