terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.54.0"
    }
  }
   backend "s3" {
    bucket       = "bhavanitfstate"
    key          = "bhavani/terrform_class_1.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # Enables S3-managed locking
  }
}

provider "aws" {}
