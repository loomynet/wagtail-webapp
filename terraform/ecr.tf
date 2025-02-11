resource "aws_ecr_repository" "wagtail_repo" {
  name = var.ecr_repository_name
}
