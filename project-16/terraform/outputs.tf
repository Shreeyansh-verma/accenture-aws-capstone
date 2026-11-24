output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.main.dns_name
}

output "ec2_instance_id" {
  description = "Backend EC2 instance"
  value       = aws_instance.web.id
}

output "target_group_arn" {
  description = "ALB target group"
  value       = aws_lb_target_group.web.arn
}
