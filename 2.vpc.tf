resource "aws_vpc" "awsb74_vpc_1" {
  cidr_block           = "10.125.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name        = "awsb74_vpc_1"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.awsb74demobucket003]
}


resource "aws_internet_gateway" "awsb74_vpc_1_igw" {
  vpc_id = aws_vpc.awsb74_vpc_1.id
  tags = {
    Name        = "awsb74_vpc_1_igw"
    Environment = "Dev"
  }
}

# Testing Explicit Dependency
resource "aws_s3_bucket" "awsb74demobucket001" {
  bucket = "awsb74demobucket001"
  tags = {
    Name        = "awsb74demobucket001"
    Environment = "Dev"
  }

}
resource "aws_s3_bucket" "awsb74demobucket002" {
  bucket = "awsb74demobucket002"
  tags = {
    Name        = "awsb74demobucket002"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.awsb74demobucket001]
}
resource "aws_s3_bucket" "awsb74demobucket003" {
  bucket = "awsb74demobucket003"
  tags = {
    Name        = "awsb74demobucket003"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.awsb74demobucket002]
}
