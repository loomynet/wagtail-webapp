output "ecr_repository_uri" {
  value = aws_ecr_repository.wagtail_repo.repository_url
}

output "app_runner_service_arn" {
  value = aws_apprunner_service.wagtail_service.arn
}
