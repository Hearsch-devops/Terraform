Terraform Variable Override Default value– Learning Objectives
🎯 Learning Objectives
Understand how to override default variable values in Terraform.
Learn different methods to pass variable values during plan and apply.
Understand how to generate and use a saved execution plan file.

🟢 Option 1: Pass Variables Directly Using -var
You can override default variable values directly in the command line using the -var flag.
Example:
terraform plan -var="aws_instance_type=t3.small" -var="aws_count=2"
terraform apply -var="aws_instance_type=t3.small" -var="aws_count=2"

🔎 Important Notes:
The variable name must exactly match the variable defined in your Terraform script.
This method is quick and useful for testing changes.
Values must be provided every time you run plan or apply.

🔵 Option 2: Generate and Use a Plan File
You can create a saved execution plan file and then apply it later.
Step 1: Generate Plan File
terraform plan -var="aws_instance_type=t3.small" -var="aws_count=2" -out save.plan
This command:
Generates a plan
Saves it to a file (save.plan)
The file name can be anything
Step 2: Apply the Saved Plan
terraform apply save.plan

🔎 Important Notes:
This ensures the exact same plan is applied.
Useful for production workflows.
Helps in CI/CD pipelines.
Prevents accidental changes between plan and apply.

🏆 Key Takeaways
-var allows dynamic value injection.
Variable names must match exactly.
Saved plan files ensure consistency and predictability.
Option 2 is recommended for controlled environments.
You can override them without editing code using either method above.