resource "aws_vpc" "awsb74_vpc_1" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name        = lower(var.vpc_name)
    Environment = upper(var.env)
  }
}


resource "aws_internet_gateway" "awsb74_vpc_1_igw" {
  vpc_id = aws_vpc.awsb74_vpc_1.id
  tags = {
    Name        = "${var.vpc_name}_igw"
    Environment = var.env
  }
}
