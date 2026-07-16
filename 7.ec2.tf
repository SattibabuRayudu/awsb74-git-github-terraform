data "aws_ami" "my_ami" {
  most_recent = true
  name_regex  = "^AWS-B74"
  owners      = ["672790302267"]
}


resource "aws_instance" "webservers" {
  count = 1
  #ami = var.imagename
  #ami = "ami-0d857ff0f5fc4e03b"
  ami                         = data.aws_ami.my_ami.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.awsb74_vpc_1_public_subnets[*].id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.awsb74_vpc_sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "awsb74_vpc_1_public_server_0${count.index + 1}"
    Env  = var.env
  }
  user_data = <<-EOF
		#! /bin/bash
        sudo apt-get update
	EOF
  lifecycle {
    prevent_destroy = true
  }
}