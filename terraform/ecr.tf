resource "aws_ecr_repository" "wagtail_repo" {
  name = var.ecr_repository_name

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [image_tag_mutability, image_scanning_configuration]
  }
}
