# Subnets
output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.ec2-a.id
}
output "instance_name" {
  description = "Name of the instance"
  value       = aws_instance.ec2-a.key_name
}
output "public_ip_address" {
  description = "EC2 public IP address"
  value       = aws_instance.ec2-a.public_ip
}
output "private_ip_address" {
  description = "EC2 public IP address"
  value       = aws_instance.ec2-b.private_ip
}
output "pv_instance_id" {
  description = "My Private instance ID"
  value       = aws_instance.ec2-b.id
}
