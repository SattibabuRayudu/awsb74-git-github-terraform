output "name" {
  value = data.aws_ami.my_ami.id
}

output "public_ips_of_servers" {
  value = aws_instance.webservers[*].public_ip
}

output "private_ips_of_servers" {
  value = aws_instance.webservers[*].private_ip
}