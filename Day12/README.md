# Terraform Input Variables – Map Type

## Overview
This example demonstrates how to use **Terraform input variables with the `map` type**.  
A **map variable** stores values in **key–value pairs**, which makes it easy to manage multiple configurations such as different EC2 instance sizes.

---
Why Use Map Variables?
Store multiple values in key-value format
Improve code reusability
Avoid creating multiple variables for similar values
Make infrastructure configuration more organized

Interview Questions
1. What is a Map variable in Terraform?
A map variable stores values as key-value pairs, allowing easier configuration management.

2. How do you access values from a map variable?
var.map_name["key"]

Example:
var.aws_instance_type["micro-apps"]

3. Difference between List and Map in Terraform?
| List            | Map             |
| --------------- | --------------- |
| Ordered values  | Key-value pairs |
| Access by index | Access by key   |

4. When should you use a Map variable?

Use a map when managing multiple related configurations, such as instance types, environment variables, or tags.