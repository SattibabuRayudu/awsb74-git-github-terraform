resource "aws_security_group" "awsb74_vpc_sg" {
  name        = "${var.vpc_name}_sg"
  description = "SG For awsb74_vpc"
  vpc_id      = aws_vpc.awsb74_vpc_1.id
  tags = {
    Name = "${var.vpc_name}_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.awsb74_vpc_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}