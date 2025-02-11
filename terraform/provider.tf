provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "feb-2025-team2-bucket"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
