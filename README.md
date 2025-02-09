# AWS Terraform Setup for CloudZenia Hands-On Challenge

## Overview
This project is a fully automated **Infrastructure as Code (IaC)** setup using **Terraform** to provision cloud resources in **AWS**. The infrastructure includes:

✅ **ECS Cluster** with WordPress and a custom Node.js microservice  
✅ **RDS (MySQL Database)** for WordPress, with credentials stored in **SecretsManager**  
✅ **EC2 Instances** running NGINX & Docker, with Elastic IPs and domain-based routing  
✅ **Application Load Balancer (ALB)** for ECS & EC2 with **SSL termination (HTTPS)**  
✅ **CloudWatch Logs & Metrics** for monitoring EC2, ECS, and ALB  
✅ **S3 Static Website Hosting with CloudFront (Optional)**  
✅ **GitHub Actions CI/CD Pipeline** to deploy changes automatically  

---
## Project Structure
```sh
aws-terraform-setup/
│── modules/
│   ├── networking/         # VPC, Subnets, Security Groups
│   ├── ecs/                # ECS Cluster, Task Definitions, Services
│   ├── rds/                # RDS Instance & SecretsManager
│   ├── ec2/                # EC2 Instances, NGINX, Docker, Elastic IPs
│   ├── s3/                 # S3 Static Website & CloudFront (Optional)
│── main.tf                 # Calls all modules
│── variables.tf            # Global variables
│── outputs.tf              # Global outputs
│── providers.tf            # AWS provider configuration
│── terraform.tfvars        # Variable values
│── .github/
│   ├── workflows/
│   │   ├── deploy.yml       # GitHub Actions CI/CD Pipeline
│── README.md                # Project documentation
```

---
## Requirements
Before running this project, ensure you have:
1. **AWS CLI Installed & Configured**
   ```sh
   aws configure
   ```
2. **Terraform Installed**
   ```sh
   terraform -v
   ```
3. **GitHub Repository (Optional)** for CI/CD Deployment

---
## Deployment Steps
### 1️⃣ Clone the Repository
```sh
git clone <repo-url>
cd aws-terraform-setup
```

### 2️⃣ Initialize Terraform
```sh
terraform init
```

### 3️⃣ Plan Deployment
```sh
terraform plan
```

### 4️⃣ Apply Configuration
```sh
terraform apply -auto-approve
```
This will provision **all AWS resources** automatically.

### 5️⃣ Verify the Deployment
- **Check ECS Services:**
  ```sh
  aws ecs list-services --cluster ecs-cluster
  ```
- **Check EC2 Instances:**
  ```sh
  aws ec2 describe-instances
  ```
- **Check Load Balancer:**
  ```sh
  aws elbv2 describe-load-balancers
  ```
- **Check RDS Database:**
  ```sh
  aws rds describe-db-instances
  ```
- **Check S3 Bucket (if enabled):**
  ```sh
  aws s3 ls
  ```

---
## Additional Setup
### 🔹 Configure Domain & SSL (Optional)
If using **Route 53**, update your DNS records to point to the **ALB or EC2 Elastic IPs**.
To install **Let's Encrypt SSL** on EC2 (NGINX):
```sh
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d your-domain.com
```

### 🔹 Monitor Logs & Metrics
- **Check CloudWatch Logs:**
  ```sh
  aws logs describe-log-groups
  ```
- **Check EC2 RAM Usage in CloudWatch:**
  ```sh
  aws cloudwatch list-metrics --namespace "CWAgent"
  ```

---
## Clean Up (Destroy Resources)
To **avoid AWS billing**, destroy all resources when done:
```sh
terraform destroy -auto-approve
```

---
## CI/CD Pipeline (GitHub Actions)
The **deploy.yml** workflow automatically deploys Terraform changes when code is pushed.

- **Trigger:** Any push to the repository
- **Actions:**
  - Checkout code
  - Setup Terraform
  - Run `terraform init`, `terraform apply`


# Infrastructure Setup

## Overview
This document provides an overview of the infrastructure setup using Terraform.

## Modules
- **Networking**: Sets up VPC, subnets, and security groups.
- **ECS**: Configures ECS cluster, services, and task definitions.
- **RDS**: Sets up RDS instance and SecretsManager.
- **EC2**: Deploys EC2 instances and configures NGINX.
- **S3**: Configures S3 bucket for static website hosting.

## Endpoints
- WordPress: https://wordpress.<domain-name>
- Microservice: https://microservice.<domain-name>
- EC2 Instance: https://ec2-instance.<domain-name>
- EC2 Docker: https://ec2-docker.<domain-name>
- Static Website: https://static-s3.<domain-name>

## Configuration
- Ensure the AWS credentials are set up correctly.
- Update the domain names and other variables in the Terraform scripts.


---
## Next Steps
🚀 **Run Terraform & Verify Your AWS Resources**
⚙️ **Configure Domain & SSL (Optional)**
📊 **Monitor CloudWatch Metrics**
🧹 **Destroy Resources When Done**

---
## Support
If you encounter issues, refer to **AWS Documentation**, **Terraform Docs**, or ask in **AWS Community Forums**.

---

