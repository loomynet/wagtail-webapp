variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "app_runner_role_arn" {
  description = "IAM Role ARN for AWS App Runner"
  type        = string
  default     = "arn:aws:iam::597765856364:role/service-role/Team2AppRunnerAccessRole"
}

variable "ecr_repository_name" {
  description = "ECR Repository Name"
  default     = "team2-wagtail-cms"
}

variable "auto_scaling_name" {
  description = "App Runner Auto Scaling Configuration"
  default     = "Team2-Wagtail-AutoScaling"
}
