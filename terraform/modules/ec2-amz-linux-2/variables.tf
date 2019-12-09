
variable "region" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = string
  default     = "ap_southeast-2"
}

variable "pb_subnet_id" {
  description = "Public Subnet ID from the network module"
  type        = string
  default     = "pbsubnetid"
}

variable "pv_subnet_id" {
  description = "Private Subnet ID from the network module"
  type        = string
  default     = "pvsubnetid"
}

variable "assoc_pb_ip" {
  description = "Associate public IP address option"
  type        = string
  default     = "true"
}

variable "ec2name" {
  description = "Name of the ec2"
  type        = string
  default     = "myec2"
}

variable "pb_sec_groups_id" {
  description = "Public Security Groups List"
  type        = string
  default     = "myPBSecGroup"
}

variable "pv_sec_groups_id" {
  description = "Private Security Groups List"
  type        = string
  default     = "myPVSecGroup"
}

variable "pv_instance_id" {
  description = "Private Instance ID"
  type        = string
  default     = "myInstanceID"
}
