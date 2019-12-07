
variable "region" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = string
  default     = "ap_southeast-2"
}

variable "subnet_id" {
  description = "Subnet ID from the network module"
  type        = string
  default     = "subnetid"
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

variable "sec_groups_id" {
  description = "Security Groups List"
  type        = string
  default     = "mySecGroup"
}