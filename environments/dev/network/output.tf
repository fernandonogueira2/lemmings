# Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.network.public_subnets
}
