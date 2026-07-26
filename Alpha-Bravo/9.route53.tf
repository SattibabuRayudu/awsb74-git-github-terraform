#Creating Route53 DNS Record For NLB
module "alpha_route53_1_nlb" {
  count      = var.create_nlb ? 1 : 0
  source     = "../modules/8.route53"
  domainname = var.domainname
  nlb_id     = try(module.alpha_elb_1[0].elb_id, null)
  dns_name   = try(module.alpha_elb_1[0].elb_dns_name, "null")
  zone_id    = try(module.alpha_elb_1[0].elb_zone_id, "null")
  recordname = "nlb"
}

#Creating Route53 DNS Record For ALB
module "alpha_route53_1_alb" {
  count      = var.create_alb ? 1 : 0
  source     = "../modules/8.route53"
  domainname = var.domainname
  nlb_id     = try(module.alpha_elb_alb_1[0].elb_id, null)
  dns_name   = try(module.alpha_elb_alb_1[0].elb_dns_name, "null")
  zone_id    = try(module.alpha_elb_alb_1[0].elb_zone_id, "null")
  recordname = "alb"
}