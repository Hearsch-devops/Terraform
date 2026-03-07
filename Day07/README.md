# Terraform `for_each` with Map and Set

## Overview

This project demonstrates how to use the **`for_each` meta-argument in Terraform** to create multiple resources dynamically using:

* **Map**
* **Set (`toset()`)**

Using `for_each` helps avoid writing repetitive resource blocks and makes infrastructure **scalable and maintainable**.

---

# 1. Using `for_each` with Map

A **map** contains **key-value pairs**.
When used with `for_each`, Terraform creates one resource for each key.

## Example

```hcl
variable "instance" {
  type = map(string)

  default = {
    web1 = "t3.micro"
    web2 = "t3.micro"
    web3 = "t3.micro"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0ecb62995f68bb549"
  for_each      = var.instance
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
```

### How it works

| Expression   | Meaning                    |
| ------------ | -------------------------- |
| `each.key`   | Map key (web1, web2, web3) |
| `each.value` | Map value (instance type)  |

Terraform will create **3 EC2 instances** with names `web1`, `web2`, and `web3`.

---

# 2. Using `for_each` with Set

A **set** contains **unique values only**.
Terraform cannot directly iterate over lists with `for_each`, so we convert them using `toset()`.

## Example

```hcl
variable "ports" {
  default = [22, 80, 443]
}

resource "aws_security_group_rule" "allow_ports" {
  for_each = toset(var.ports)

  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  security_group_id = "sg-123456"
  cidr_blocks       = ["0.0.0.0/0"]
}
```

### How it works

| Expression   | Meaning     |
| ------------ | ----------- |
| `each.value` | Port number |

Terraform creates **one rule for each port**.

---

# Map vs Set in `for_each`

| Feature       | Map                      | Set                |
| ------------- | ------------------------ | ------------------ |
| Structure     | Key + Value              | Only Values        |
| Access        | `each.key`, `each.value` | `each.value`       |
| Best Use Case | Named resources          | Repeated values    |
| Example       | EC2 instances            | Ports, CIDR blocks |

---

# Advantages of `for_each`

* Reduces repetitive Terraform code
* Allows dynamic resource creation
* Maintains resource identity
* Safer than `count` when modifying resources

---

# Interview Questions

### 1. What is `for_each` in Terraform?

`for_each` is a meta-argument that allows Terraform to create multiple instances of a resource using a **map or set of values**.

---

### 2. Difference between `count` and `for_each`?

| Feature           | count                       | for_each        |
| ----------------- | --------------------------- | --------------- |
| Uses              | Index numbers               | Unique keys     |
| Resource identity | Can shift when list changes | Stable          |
| Best for          | Simple repetition           | Named resources |

---

### 3. Why do we use `toset()` with `for_each`?

`for_each` requires **unique keys**, and sets automatically remove duplicate values.

---

### 4. When should we use Map with `for_each`?

When resources require **both a unique name (key) and a value**, such as creating multiple EC2 instances with different names.

---

### 5. What happens if you remove an item from a map used in `for_each`?

Terraform will **destroy only that specific resource**, keeping the others unchanged.

---

### 6. Can we use a list directly with `for_each`?

No. Lists must be converted to a **set using `toset()`** because `for_each` requires unique elements.

---

# Conclusion

Using `for_each` with **map and set** is a powerful Terraform feature that helps create **dynamic, scalable, and maintainable infrastructure** while avoiding repetitive code.
