# Instance ID
output "pv_instance_id" {
  description = "Private instance id"
  value       = module.ec2-amz-linux-2.instance_id
}
