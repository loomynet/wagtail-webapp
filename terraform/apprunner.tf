resource "aws_apprunner_service" "wagtail_service" {
  service_name = var.app_runner_name

  source_configuration {
    authentication_configuration {
      access_role_arn = var.app_runner_role_arn
    }

    image_repository {
      image_configuration {
        port = "8000"
      }
      image_identifier = "${aws_ecr_repository.wagtail_repo.repository_url}:${var.image_tag}"
      # image_indentifier   = "597765856364.dkr.ecr.eu-west-1.amazonaws.com/nginx-test:latest"
      image_repository_type = "ECR"
    }
  }

  instance_configuration {
    cpu    = "1024"
    memory = "2048"
  }

  health_check_configuration {
    protocol = "HTTP"
  }

  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.auto_scaling.arn
}
