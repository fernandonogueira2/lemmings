# Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.myPublicSubnet.id
}
output "private_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.myPrivateSubnet.id
}
output "pb_sec_groups_id" {
  description = "List of public Security Groups"
  value       = aws_security_group.allow-ssh-pb.id
}
output "pv_sec_groups_id" {
  description = "List of private Security Groups"
  value       = aws_security_group.allow-ssh-pv.id
}
