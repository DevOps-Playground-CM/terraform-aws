# 🌍 DevOps Playground – Terraform AWS Projects Repo

Welcome to the **DevOps Playground Terraform Repo** — a curated collection of Terraform modules and project folders, each designed to provision AWS resources efficiently with clear documentation and best practices.

---

## 📁 Folder Structure (Example)

`terraform-aws/`

├── `vpc-setup/`               # Create a VPC with subnets, IGW, and route tables

├── `ec2-instance/`            # Launch EC2 with key pair, security group, and userdata

├── `s3-bucket/`               # Provision secure and versioned S3 buckets

├── `rds-mysql/`               # Deploy RDS MySQL with subnet group and security group

├── `iam-roles/`               # Create IAM roles and policies for EC2 and Lambda

├── `cloudwatch-alarms/`       # Set up alarms for EC2, RDS, and Lambda

├── `ecs-cluster/`             # Bootstrap an ECS Cluster with networking

└── `terraform-backend/`       # Remote backend setup with S3 and DynamoDB

Each folder includes:

* Terraform modules or standalone configurations
* A `README.md` for usage, prerequisites, and deployment steps
* Sample variable files (e.g., `terraform.tfvars.example`)

---

## 🚀 Getting Started

1. Navigate to the folder for the AWS resource/project you want.
2. Review the `README.md` to understand the architecture and setup.
3. Run standard Terraform steps:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

---

## 📦 Adding a New Project

When adding your own Terraform configuration:

✅ **Create a new folder** named after the AWS service or purpose (e.g., `lambda-deploy`, `cloudfront-setup`)
✅ **Include a README.md** that outlines usage and variables
✅ **Provide sample `terraform.tfvars.example`** to guide users
✅ **Keep files modular, reusable, and provider-agnostic if possible**
✅ **Use meaningful outputs and descriptive variable names**

---

## 🧰 Best Practices

* Format code using `terraform fmt`
* Validate with `terraform validate`
* Use `.terraform.lock.hcl` for provider version consistency
* Isolate sensitive values in `terraform.tfvars` or environment variables
* Prefer modules when possible

---

## 🤝 Contribution Guidelines

* One resource/project = One folder
* Always include a `README.md`
* Use examples and sensible defaults
* Keep variable and output descriptions clear
* Test before submitting changes

---

## 🛡️ Maintainers

This repository is maintained by the **DevOps Playground Terraform Team**, built for learning, sharing, and launching real AWS infrastructure.

Let’s build the cloud right! ☁️✨
