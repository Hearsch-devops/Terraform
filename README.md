                                                              Install Terraform on AWS EC2 instance:
Step 1: Update Your Server
  sudo apt update && sudo apt upgrade -y
---------------------------------------------
Step 2: Install Required Packages
  sudo apt install -y gnupg software-properties-common curl
---------------------------------------------
Step 3: Add the HashiCorp GPG Key
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
---------------------------------------------
Step 4: Add Terraform Repository
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
---------------------------------------------
Step 5: Install Terraform
  sudo apt update
  sudo apt install terraform -y
---------------------------------------------
Step 6: Verify Installation
  terraform -version
===============================================================================================================================================
Step 1 — Install AWS CLI (if not installed)
  sudo apt update
  sudo apt install awscli -y
Check version:
  aws --version
----------------------------------------------
✅ Step 2 — Configure AWS CLI with Your IAM User

Run:
  aws configure

Enter your IAM user credentials:

  AWS Access Key ID:     <YOUR_ACCESS_KEY>
  AWS Secret Access Key: <YOUR_SECRET_KEY>
  Default region name:   ap-south-1   (or your region)
  Default output format: json

✔ This creates the required files:

  ~/.aws/credentials
  ~/.aws/config

Terraform automatically reads credentials from here.
--------------------------------------------------
✅ Step 3 — Verify AWS Credentials Work

Run:
  aws sts get-caller-identity

Expected output (example):
  {
      "UserId": "AIDAxxxxxxxxxxxx",
      "Account": "123456789012",
      "Arn": "arn:aws:iam::<account-id>:user/terraform-user"
  }

If this shows correctly → Terraform authentication will work 100%.

===============================================================================================================================================
