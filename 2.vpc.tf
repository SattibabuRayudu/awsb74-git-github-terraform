resource "aws_vpc" "awsb74_vpc_1" {
  cidr_block           = "10.125.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name        = "awsb74_vpc_1"
  }
}


resource "aws_internet_gateway" "awsb74_vpc_1_igw" {
  vpc_id = aws_vpc.awsb74_vpc_1.id
  tags = {
    Name        = "awsb74_vpc_1_igw"
  }
}

# Testing Explicit Dependency
resource "aws_s3_bucket" "awsb74demobucket01" {
  bucket = "awsb74demobucket01"
  tags = {
    Name        = "awsb74demobucket01"
    Environment = "Dev"
  }

}
resource "aws_s3_bucket" "awsb74demobucket02" {
  bucket = "awsb74demobucket02"
  tags = {
    Name        = "awsb74demobucket02"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "awsb74demobucket03" {
  bucket = "awsb74demobucket03"
  tags = {
    Name        = "awsb74demobucket03"
    Environment = "Dev"
  }
}
