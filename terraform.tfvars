vpc_cidr_block = "10.125.0.0/16"
vpc_name       = "awsb74_vpc_1"
env            = "dev"
aws_region     = "us-east-1"
azs = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]
public_subnet_cidrs = [
  "10.125.1.0/24",
  "10.125.2.0/24",
  "10.125.3.0/24"
]
private_subnet_cidrs = [
  "10.125.10.0/24",
  "10.125.20.0/24",
  "10.125.30.0/24"
]

ami_id = {
  "us-east-1" = "ami-015577480ab999a26"
  "us-east-2" = "ami-0ea1cddefe0c4aed5"
}

