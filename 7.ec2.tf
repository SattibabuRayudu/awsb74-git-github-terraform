resource "aws_instance" "webservers" {
  #count = 1
  count = var.env == "dev" || var.env == "Dev" || var.env == "DEV" ? 1 : 3
  #ami = var.imagename
  #ami = "ami-0d857ff0f5fc4e03b"
  ami                         = lookup(var.ami_id,var.aws_region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.awsb74_vpc_1_public_subnets[*].id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.awsb74_vpc_sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "awsb74_vpc_1_public_server_0${count.index + 1}"
    Env  = var.env
    CustomTag = "${var.vpc_name}-${var.env}-tag-01"
  }
  user_data = <<-EOF
		#! /bin/bash
        sudo apt-get update
	EOF
  lifecycle {
    prevent_destroy       = false
    create_before_destroy = true
    ignore_changes = [
      tags["Tag1"],
      tags["Tag2"],
      tags["Tag3"]
    ]
  }
}