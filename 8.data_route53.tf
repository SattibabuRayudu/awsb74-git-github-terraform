data "aws_route53_zone" "awsb74_xyz" {
  name = "rayudu.xyz"
}

resource "aws_route53_record" "www" {
  #count   = 3
  count   = length(aws_instance.webservers[*].public_ip)
  zone_id = data.aws_route53_zone.awsb74_xyz.zone_id
  name    = "app${count.index + 1}.${data.aws_route53_zone.awsb74_xyz.name}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.webservers[*].public_ip, count.index)]
}
