output "dns_name" {
    value = module.alpha_vpc_1.vpc_id
}

output "zone_id" {
    value = module.alpha_elb_alb_1[0].elb_dns_name
}