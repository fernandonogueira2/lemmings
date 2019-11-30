# Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.myPublicSubnet.id
}
