resource "aws_apprunner_auto_scaling_configuration_version" "auto_scaling" {
  auto_scaling_configuration_name = var.auto_scaling_name

  max_concurrency = 100
  max_size        = 3
  min_size        = 1
}
