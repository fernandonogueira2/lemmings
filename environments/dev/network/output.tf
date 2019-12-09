# Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.network.public_subnets
}
output "private_subnets" {
  description = "List of IDs of public subnets"
  value       = module.network.private_subnets
}
output "pb_sec_groups_id" {
  description = "List of Public Security Groups"
  value       = module.network.pb_sec_groups_id
}
output "pv_sec_groups_id" {
  description = "List of Private Security Groups"
  value       = module.network.pv_sec_groups_id
}
