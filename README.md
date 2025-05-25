# 🛠️ Auto Infra – Automated Infrastructure Provisioning

**Auto Infra** is an automated infrastructure provisioning project designed to set up cloud infrastructure using Infrastructure as Code (IaC) principles. It leverages tools like **Terraform**, **Ansible**, and **Jenkins** to provision, configure, and deploy environments with minimal manual intervention.

---

## 📦 Features

- 🔧 Automated provisioning using **Terraform**
- ⚙️ Configuration management with **Ansible**
- 🚀 CI/CD pipeline with **Jenkins**
- ☁️ Cloud provider support: **AWS** (or your specific provider)
- 🧩 Modular and reusable infrastructure code
- 🔒 Secure credential handling

---

## 🧰 Tech Stack

- **Terraform** – Infrastructure as Code
- **Ansible** – Configuration Management
- **Jenkins** – Automation & CI/CD
- **AWS/Azure/GCP** – Cloud Provider
- **Shell scripting** – Glue logic

---

## 📁 Folder Structure

Auto_infra/
├── terraform/ # Terraform modules and main.tf
├── ansible/ # Ansible playbooks and roles
├── jenkins/ # Jenkins pipeline scripts
├── scripts/ # Custom shell scripts
├── .gitignore
├── README.md

yaml
Copy
Edit

---

## 🚀 Getting Started

### 1. Clone the Repository


git clone https://github.com/revtron/Auto_infra.git
cd Auto_infra

### 2. Provision Infrastructure (Terraform)
bash
Copy
Edit
cd terraform
terraform init
terraform apply

3. Configure Infrastructure (Ansible)
bash
Copy
Edit
cd ../ansible
ansible-playbook -i inventory playbook.yml
4. Trigger CI/CD Pipeline (Optional)
Configure Jenkins to pull this repo and execute pipeline scripts under the jenkins/ directory.

⚠️ Prerequisites
Terraform installed

Ansible installed

Jenkins is installed and running (for CI/CD)

AWS/GCP credentials set up (e.g., via environment variables or profiles)

SSH access to provisioned hosts
