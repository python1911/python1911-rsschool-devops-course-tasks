You're absolutely right — since the README is part of a public training repo and will be reviewed by mentors/peers, the instructions should be written for **third-party reviewers** rather than the original author.

Here's the revised `README.md`:

---

````markdown
# Task 2: Basic Infrastructure Configuration

## 📘 Overview

This project provisions basic AWS infrastructure using Terraform as part of the RS School DevOps course. The goal is to automate the creation of:

- A custom VPC with:
  - 2 Public subnets (in different AZs)
  - 2 Private subnets (in different AZs)
- An Internet Gateway (IGW) and NAT Gateway for internet access
- Route tables for public and private routing
- A Bastion EC2 instance with SSH access via key pair
- Proper security groups to restrict access
- OIDC-based GitHub Actions integration for CI/CD

---

## 🛠️ Infrastructure Summary

| Component       | Details                                         |
|----------------|--------------------------------------------------|
| **VPC**        | `10.0.0.0/16` with 4 subnets (2 public, 2 private) |
| **AZs**        | `us-east-1a`, `us-east-1b`                        |
| **Routing**    | Public subnets → IGW, Private subnets → NAT      |
| **Bastion Host** | EC2 `t2.micro`, SSH via public IP              |
| **NAT Gateway**| Provides internet for private subnets            |
| **Security**   | `.pem` key excluded, only SSH allowed from anywhere |
| **Automation** | Terraform with GitHub Actions OIDC integration   |

---

## ✅ How to Test

### 1. Deploy the Infrastructure

Reviewer should verify the following was run from the `task_2/` directory:

```bash
terraform init
terraform validate
terraform plan
terraform apply
````

> A `terraform.tfvars` file with correct values should exist locally (excluded from Git).

### 2. Verify Bastion SSH Access

* Confirm `bastion_public_ip` was output after `terraform apply`
* SSH using:

```bash
ssh -i "path/to/rsschool-key.pem" ec2-user@<bastion_public_ip>
```

* Run a command like `curl https://google.com` inside the Bastion to confirm internet access.

### 3. Confirm `.gitignore` Protection

Ensure sensitive files are excluded:

* `.pem` key file
* `terraform.tfvars`
* `*.tfstate`, `*.backup`, `*.tfplan`

---

## 📷 Screenshots (Proof of Work)

* ✅ AWS VPC Resource Map showing:

  * VPC name, subnets in AZs, routing, NAT/IGW
* ✅ Terminal screenshot of successful SSH into Bastion and internet access (`curl https://google.com`)
* ✅ GitHub PR with commits and clean structure

---


## 🔐 Notes

* **No credentials or `.pem` keys** are committed
* `terraform.tfvars` must be created manually by each user
* Public IP is required only to test Bastion SSH access

---

## 💬 Submission Checklist

* [x] Terraform infrastructure deploys without error
* [x] SSH to Bastion works via `.pem` key
* [x] Bastion can access internet (e.g., `curl google.com`)
* [x] `.gitignore` excludes sensitive files
* [x] GitHub PR contains description + screenshots
