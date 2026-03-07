why we need Custom Validation Rules?
    Custom Validation Rules in Terraform are used to validate input variables before Terraform creates resources. They help ensure that users provide correct and safe values, preventing configuration mistakes.

example:
variable "instance_type" {
    type = string
    validation {
        condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
        error_message = "Instance type must be t2.micro or t3.micro."
    }
}

In Terraform you typically create separate validations for separate variables.
Because validation blocks belong to a variable, not globally.
So if you have two variables:
    instance_type
    aws_region
You should create two validation rules.

example:
1️⃣ Instance Type Validation
variable "instance_type" {
    type = string

    validation {
        condition     = contains(["t2.micro", "t3.micro", "t3.small"], var.instance_type)
        error_message = "Instance type must be t2.micro, t3.micro, or t3.small."
    }
}

2️⃣ Region Validation
variable "aws_region" {
    type = string

    validation {
        condition     = contains(["us-east-1", "us-west-1", "ap-south-1"], var.aws_region)
        error_message = "Region must be us-east-1, us-west-1, or ap-south-1."
    }
}

You can combine conditions using && if needed.

condition = contains(["t2.micro","t3.micro"], var.instance_type) && var.aws_region == "us-east-1"

But this is not recommended for variables, because:
Harder to debug
Less modular
Breaks Terraform design principles

Interview Tip:
How do you validate input variables in Terraform?
Answer:
Terraform uses the validation block inside variable definitions to enforce constraints on input values using expressions like contains, regex, length, or logical operators before infrastructure provisioning.