output "alb_security_group_id" {
  value = module.alb_sg.security_group_id
}

output "alb_dns_name" {
  value = aws_lb.internet-facing-lb.dns_name
}

output "alb_arn" {
  value = aws_lb.internet-facing-lb.arn
}

output "alb_dns_zone_id" {
  value = aws_lb.internet-facing-lb.zone_id
}