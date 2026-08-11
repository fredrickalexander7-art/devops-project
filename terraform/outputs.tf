output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "security_group_id" {
  value       = aws_security_group.app.id
  description = "Security Group ID"
}
