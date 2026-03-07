cmd: terraform apply/destroy -auto-approve -var-file="dev.tfvars" #file name can be anything that we provide.need to specify .tfvars 

Difference Between variables.tf and terraform.tfvars
1️⃣ variables.tf → Declares Variables (Blueprint)
This file is used to define input variables.
Think of it as:
“What inputs does my Terraform project expect?”
What it does:
Defines variable name
Defines data type
Optional default value
Optional validation
Optional description

👉 This file does NOT assign actual values (usually)
👉 It only declares what inputs are required.

2️⃣ terraform.tfvars → Assigns Values (Actual Inputs)
This file is used to provide actual values to the variables defined in variables.tf.
Think of it as:
“Here are the real values I want to use.”
Now Terraform will:
Look at variables.tf
Take values from terraform.tfvars
Use them in resources

🔹 How Terraform Reads Variables (Priority Order)
Terraform loads variables in this order:
Environment variables
terraform.tfvars
*.auto.tfvars
-var CLI argument
Default value in variables.tf
So if you don’t provide a value anywhere:
Terraform will use the default (if defined)
Otherwise it will ask you during terraform apply

