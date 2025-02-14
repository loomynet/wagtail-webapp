variable "aws_region" {
  default = "eu-west-1"
}

variable "app_runner_role_arn" {
  description = "IAM Role ARN for AWS App Runner"
  type        = string
  default     = "arn:aws:iam::597765856364:role/service-role/Team2AppRunnerAccessRole"
}

variable "app_runner_name" {
  default = "Team2-WagtailCMS"
}

variable "ecr_repository_name" {
  default = "team2-wagtail-cms"
}

variable "auto_scaling_name" {
  description = "App Runner Auto Scaling Configuration"
  default     = "Team2-Wagtail-AutoScaling"
}

variable "s3_bucket_name" {
  default = "feb-2025-team2-bucket"
}

variable "image_tag" {
  description = "Tag for the ECR Docker image"
  type        = string
  default     = "latest"
}
