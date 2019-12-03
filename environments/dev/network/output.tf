# Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.network.public_subnets
}
output "sec_groups_id" {
  description = "List of Security Groups"
  value       = module.network.sec_groups_id
}
