variable "vpc_cidr_block" {
  type        = string
  default     = "10.125.0.0/16"
  description = "CIDR Block For VPC"
  validation {
    condition = contains([
      "10.125.0.0/16",
      "10.126.0.0/16",
      "10.127.0.0/16",
    ], var.vpc_cidr_block)
    error_message = "vpc_cidr must be one of: 10.125.0.0/16, 10.126.0.0/16, 10.127.0.0/16."
  }
}

variable "vpc_name" {
  type    = string
  default = "awsb74_vpc_1"
}

variable "env" {
  type    = string
  default = "dev"
  validation {
    condition = contains([
      "dev",
      "uat",
      "prod",
    ], var.env)
    error_message = "Env must be one of: dev, uat, prod."
  }
}

resource "aws_vpc" "awsb74_vpc_1" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Environment = var.env
  }
}


resource "aws_internet_gateway" "awsb74_vpc_1_igw" {
  vpc_id = aws_vpc.awsb74_vpc_1.id
  tags = {
    Name        = "${var.vpc_name}_igw"
    Environment = var.env
  }
}
