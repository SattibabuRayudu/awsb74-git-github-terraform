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

resource "aws_route_table_association" "awsb74_vpc_1_subnet_1" {
  subnet_id      = aws_subnet.awsb74_vpc_1_subnet_1.id
  route_table_id = aws_route_table.awsb74_vpc_public_rt.id
}

resource "aws_route_table_association" "awsb74_vpc_1_subnet_2" {
  subnet_id      = aws_subnet.awsb74_vpc_1_subnet_2.id
  route_table_id = aws_route_table.awsb74_vpc_public_rt.id
}

resource "aws_route_table_association" "awsb74_vpc_1_subnet_3" {
  subnet_id      = aws_subnet.awsb74_vpc_1_subnet_3.id
  route_table_id = aws_route_table.awsb74_vpc_public_rt.id
}