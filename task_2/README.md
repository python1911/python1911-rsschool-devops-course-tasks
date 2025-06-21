# Task 2: Basic Infrastructure Configuration

## Overview

This Terraform setup creates:
- VPC with public/private subnets (2 AZs)
- Internet Gateway and routing
- Bastion host for SSH access
- NAT Gateway for private subnet internet access
- Security groups and basic rules
- GitHub Actions for CI

## How to Use

```bash
terraform init
terraform plan
terraform apply
