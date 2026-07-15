resource "aws_subnet" "awsb74_vpc_1_public_subnets" {
  #count                   = 3 # 0 1 2 
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.awsb74_vpc_1.id
  availability_zone       = element(var.azs, count.index)
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "awsb74_vpc_1_public_subnet_${count.index + 1}"
  }
}

resource "aws_subnet" "awsb74_vpc_1_private_subnets" {
  #count                   = 3 # 0 1 2 
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.awsb74_vpc_1.id
  availability_zone       = element(var.azs, count.index)
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "awsb74_vpc_1_private_subnet_${count.index + 1}"
  }
}

