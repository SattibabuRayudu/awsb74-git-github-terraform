resource "aws_instance" "private_servers" {
  count = var.env == "DEV" || var.env == "dev" ? 3 : 1
  ami = lookup(var.ami_id, var.aws_region)
  instance_type = lookup(var.instance_types, lower(var.env))
  subnet_id = element(aws_subnet.awsb74_vpc_1_public_subnets[*].id, count.index)
   associate_public_ip_address = true
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.awsb74_vpc_sg.id]

  tags = {
    Name       = "awsb74_vpc_1__server_0${count.index + 1}"
    Env        = var.env
    CustomTag1 = local.customtag001
    CustomTag2 = local.customtag002
    CustomTag3 = local.try_var
    CustomTag4 = local.coalesce_var
  }

  dynamic "ebs_block_device" {
    for_each = var.additional_volumes # e.g., list of maps with size, type, device_name
    content {
      device_name = ebs_block_device.value.device_name
      volume_size = ebs_block_device.value.size
      volume_type = ebs_block_device.value.type
      delete_on_termination = true
      iops = ebs_block_device.value.type == "io1" ? 100 : null
    }
  }

  provisioner "file" {
    source      = "script.sh"  # Local path
    destination = "/tmp/script.sh"  # Remote absolute path

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("/root/.ssh/my-key.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/script.sh",
      "sudo apt update -y",
    ]

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("/root/.ssh/my-key.pem")
      host        = self.public_ip
    }
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx jq net-tools
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.nginx-debian.html
EOF
}