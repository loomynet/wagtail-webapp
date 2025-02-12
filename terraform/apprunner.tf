resource "aws_apprunner_service" "wagtail_service" {
  service_name = "Team2-WagtailCMS"

  source_configuration {
    authentication_configuration {
      access_role_arn = var.app_runner_role_arn
    }

    image_repository {
      image_configuration {
        port = "80"
        # runtime_environment_variables = {
        #   DJANGO_SETTINGS_MODULE = "WebSite.settings"
        # }
      }
      image_identifier      = "${aws_ecr_repository.wagtail_repo.repository_url}:${var.image_tag}"
      image_repository_type = "ECR"
    }
  }

  instance_configuration {
    cpu    = "1024"
    memory = "2048"
  }

  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.auto_scaling.arn
}
