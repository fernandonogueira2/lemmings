# Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.myPublicSubnet.id
}
output "sec_groups_id" {
  description = "List of Security Groups"
  value       = aws_security_group.allow-ssh.id
}
