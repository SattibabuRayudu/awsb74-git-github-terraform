provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.assume_rolename
  }
}

terraform {
  required_version = "~> 1.15.8"
  required_providers {
    aws = {
      version = "<= 6.54.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "rayudu-terraform-modules"
    key    = "customer_workspace_awsb74.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
