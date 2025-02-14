provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = var.s3_bucket_name
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}
