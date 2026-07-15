variable "azs" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  #                  0            1             2
}

variable "public_subnet_cidrs" {
  type    = list(any)
  default = ["10.125.1.0/24", "10.125.2.0/24", "10.125.3.0/24"]
  #                  0              1               2
}

variable "private_subnet_cidrs" {
  type    = list(any)
  default = ["10.125.10.0/24", "10.125.20.0/24", "10.125.30.0/24"]
  #                  0              1               2
}

resource "aws_subnet" "awsb74_vpc_1_public_subnets" {
  count                   = 3 # 0 1 2 
  vpc_id                  = aws_vpc.awsb74_vpc_1.id
  availability_zone       = element(var.azs, count.index)
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "awsb74_vpc_1_public_subnet_${count.index + 1}"
  }
}

resource "aws_subnet" "awsb74_vpc_1_private_subnets" {
  count                   = 3 # 0 1 2 
  vpc_id                  = aws_vpc.awsb74_vpc_1.id
  availability_zone       = element(var.azs, count.index)
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "awsb74_vpc_1_private_subnet_${count.index + 1}"
  }
}

