# Instance ID
output "pv_instance_id" {
  description = "Private instance id"
  value       = module.ec2-amz-linux-2.instance_id
}
output "public_IP" {
  description = "Public IP Address of instance EC2-A"
  value       = module.ec2-amz-linux-2.public_ip_address
}
output "private_IP" {
  description = "Private IP Address of instance EC2-B"
  value       = module.ec2-amz-linux-2.private_ip_address
}