# Subnets
output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.ec2-a.id
}
output "instance_name" {
  description = "Name of the instance"
  value       = aws_instance.ec2-a.key_name
}
