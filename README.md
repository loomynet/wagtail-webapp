# Wagtail Web App Deployment Automation

## Documentation: https://docs.google.com/document/d/1pGZhLO8rN69eQyHd8a6YEKhT17V5GSBGqogni_wwsXQ/edit?usp=sharing

## Project Overview
This project focuses on automating the development, deployment, and maintenance of a Wagtail-based website for a tech start-up. The website is powered by Wagtail CMS and deployed using AWS App Runner with a fully automated CI/CD pipeline built on GitHub Actions and Terraform.

The goal is to provide a scalable and efficient solution that minimizes manual intervention, allowing rapid content management and deployment.

## Key Features
### Automated Infrastructure Deployment
- Provisioning AWS resources (ECR, App Runner, S3, CloudWatch) using Terraform.
- Managing Terraform state files securely in AWS S3.

### CI/CD Pipeline for Deployment
- GitHub Actions pipeline automatically builds, tags, and pushes Docker images to AWS ECR.
- Deployments are triggered upon changes to the main branch and are handled via AWS App Runner.

### Wagtail CMS Implementation
- A user-friendly admin panel for managing content dynamically.
- Built-in SEO tools, content versioning, and role-based access for editors.

### Monitoring & Logging
- AWS CloudWatch logs all App Runner activities for debugging and system reliability.
- Basic health monitoring ensures stable deployments.

## Tech Stack
- **Infrastructure as Code (IaC)**: Terraform
- **Cloud Provider**: AWS (S3, ECR, App Runner, CloudWatch)
- **CI/CD**: GitHub Actions
- **Containerization**: Docker
- **Application Framework**: Django (Wagtail CMS)

## Setup Instructions
### Clone the Repository
```bash
git clone https://github.com/your-repo-name.git
cd your-repo-name
```

### Set Up AWS Credentials
Ensure AWS CLI is installed and configured:
```bash
aws configure
```

### Build & Run Locally
```bash
docker build -t wagtail-app .
docker run -p 8000:8000 wagtail-app
```
## Add secrets
Add all the necessary GitHub Actions secrets in your repository settings.

## Change Terraform configuration
1. Go to variables.tf and change values to what you need.
2. Go to provider.tf and set up the s3 backend for terraform to store the terraform.tfstate file. (s3 have to be created manually in aws)
3. Also you can configure autoscaling for apprunner in autoscaling.tf file.

### Deploy via GitHub Actions
Push changes to the main branch, and the pipeline will automatically deploy the latest version.

## Troubleshooting & Common Issues
### Deployment Fails with "can't connect to 0.0.0.0:80"
- Ensure the application is listening on port 8000, as Wagtail defaults to that.

### IAM Role Issues in App Runner
- Make sure the correct IAM service role is assigned to App Runner.

### CSRF Verification Error in Wagtail Admin Panel
- Add the AWS App Runner-generated domain to the Django `ALLOWED_HOSTS` setting.

## Contributors
- Accenture Bootcamp Team 2 – DevOps & Automation students

This repository is open for collaboration and improvements. Feel free to fork and contribute.
