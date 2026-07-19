variable "vpc_cidr_block" {
  type = string
  #default     = "10.125.0.0/16"
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
  type = string
  #default = "awsb74_vpc_1"
}

variable "env" {
  type = string
  #default = "dev"
  validation {
    condition = contains([
      "dev",
      "uat",
      "prod",
    ], var.env)
    error_message = "Env must be one of: dev, uat, prod."
  }
}

variable "azs" {
  type = list(any)
  #default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  #                  0            1             2
}

variable "public_subnet_cidrs" {
  type = list(any)
  #default = ["10.125.1.0/24", "10.125.2.0/24", "10.125.3.0/24"]
  #                  0              1               2
}

variable "private_subnet_cidrs" {
  type = list(any)
  #default = ["10.125.10.0/24", "10.125.20.0/24", "10.125.30.0/24"]
  #                  0              1               2
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ami_id" {
  type = map(string)
}

variable "aws_region" {
  type = string
}

variable "bucket_names_suffix" {
  type = list(any)
}

variable "try_variable" {
 default = ""
}
