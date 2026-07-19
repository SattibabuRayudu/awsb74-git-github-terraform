locals {
  customtag001 = join("__",[var.vpc_name,var.env,"tag-01"])
  splittag = split("-","Welcome-To-AWS-Training-In-Telugu")
  customtag002 = join("________",local.splittag)
  try_var = length(trimspace(var.try_variable)) > 0 ? var.try_variable : "Try_Var_Not_Found"
  coalesce_var = coalesce(var.try_variable, "Var_Is_Null_Or_Empty_1", "Var_Is_Null_Or_Empty_2")
}


#The try() function only triggers the fallback on runtime errors (like missing attributes), not empty values.
#coalesce() function returns the first argument that is not null and not empty.

resource "aws_instance" "webservers" {
  #count = 1
  count = var.env == "dev" || var.env == "Dev" || var.env == "DEV" ? 1 : 3
  #ami = var.imagename
  #ami = "ami-0d857ff0f5fc4e03b"
  ami                         = lookup(var.ami_id, var.aws_region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.awsb74_vpc_1_public_subnets[*].id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.awsb74_vpc_sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name      = "awsb74_vpc_1_public_server_0${count.index + 1}"
    Env       = var.env
    CustomTag1 = local.customtag001
    CustomTag2 = local.customtag002
    CustomTag3 = local.try_var
    CustomTag4 = local.coalesce_var
  }
  user_data = <<-EOF
		#!/bin/bash
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