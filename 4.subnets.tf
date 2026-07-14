resource "aws_subnet" "awsb74_vpc_1_subnet_1" {
  vpc_id     = aws_vpc.awsb74_vpc_1.id
  availability_zone = "us-east-1a"
  cidr_block = "10.125.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "awsb74_vpc_1_subnet_1"
  }
}

resource "aws_subnet" "awsb74_vpc_1_subnet_2" {
  vpc_id     = aws_vpc.awsb74_vpc_1.id
  availability_zone = "us-east-1b"
  cidr_block = "10.125.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "awsb74_vpc_1_subnet_2"
  }
}

resource "aws_subnet" "awsb74_vpc_1_subnet_3" {
  vpc_id     = aws_vpc.awsb74_vpc_1.id
  availability_zone = "us-east-1c"
  cidr_block = "10.125.3.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "awsb74_vpc_1_subnet_3"
  }
}