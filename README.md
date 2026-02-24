# 🚀 Provisioning Gogs Git Server on AWS EC2 with PostgreSQL RDS using Terraform

## 📌 Project Overview

This project demonstrates how to provision a **self-hosted Git service (Gogs)** on **AWS EC2** with a **PostgreSQL database hosted on Amazon RDS**, fully automated using **Terraform (Infrastructure as Code)**.

The infrastructure follows a **frontend–backend architecture**:

- 🖥️ EC2 → Hosts the Gogs application (Frontend)
- 🗄️ Amazon RDS (PostgreSQL) → Backend Database
- 🏗️ Terraform → Infrastructure provisioning & lifecycle management

---

## 🏗️ Architecture Diagram (Logical Flow)

User → EC2 (Gogs :3000) → RDS PostgreSQL (Private Subnet)

---

## 📁 Project Structure
terraform-aws-gogs-project/
│── provider.tf
│── variables.tf
│── main.tf
│── outputs.tf
│── terraform.tfvars
│── .gitignore
│
└── user_data/
└── gogs.sh


---

## 🔧 Technologies Used

- AWS (EC2, VPC, RDS, Security Groups)
- Terraform
- PostgreSQL
- Gogs (Self-hosted Git service)
- Linux (Amazon Linux)

---

## 🌐 Infrastructure Components

### ✅ Networking
- Custom VPC (10.0.0.0/16)
- 2 Public Subnets
- Internet Gateway
- Route Table

### ✅ Security
- EC2 Security Group
  - SSH (22) → Your IP
  - Port 3000 → 0.0.0.0/0
- RDS Security Group
  - PostgreSQL (5432) → Allowed only from EC2 SG

### ✅ Compute
- EC2 instance (t2.micro)
- User-data script installs and runs Gogs

### ✅ Database
- Amazon RDS PostgreSQL 14
- Private access (not publicly accessible)
- 20GB storage

---
## 🔐 Variables

Sensitive values are handled securely using variables.

Example:

```hcl
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
----
## 🔽 Clone This Repository

Clone the project using Git:

```bash
git clone https://github.com/kartikakade0427/Provisioning-a-Gogs-Git-Server-on-EC2-with-PostgreSQL-RDS-Using-Terraform.git


