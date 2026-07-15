resource "aws_route_table" "awsb74_vpc_public_rt" {
  vpc_id = aws_vpc.awsb74_vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.awsb74_vpc_1_igw.id
  }
  tags = {
    Name = "awsb74_vpc_public_rt"
  }
}

resource "aws_route_table" "awsb74_vpc_private_rt" {
  vpc_id = aws_vpc.awsb74_vpc_1.id
  tags = {
    Name = "awsb74_vpc_private_rt"
  }
}

resource "aws_route_table_association" "awsb74_vpc_1_public_subnets" {
  #count = 3
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.awsb74_vpc_1_public_subnets[*].id, count.index)
  route_table_id = aws_route_table.awsb74_vpc_public_rt.id
}


resource "aws_route_table_association" "awsb74_vpc_1_private_subnets" {
  #count = 3
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.awsb74_vpc_1_private_subnets[*].id, count.index)
  route_table_id = aws_route_table.awsb74_vpc_private_rt.id
}


