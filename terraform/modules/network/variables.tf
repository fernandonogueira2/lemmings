variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "myVPC1"
}

variable "igw_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "myIGW1"
}

variable "mypub_ip_address" {
  description = "Inform you public IP address here if using a router thats the one you need"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = ""
}

variable "pb_cidr" {
  description = "The CIDR block for the Public Subnet. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type = string
  default = ""
}

variable "pv_cidr" {
  description = "The CIDR block for the private Subnet. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type = string
  default = ""
}

variable "pb_subname" {
  description = "The public subnet to connect to VPC1"
  type        = string
  default     = "myPublicSubnet"
}

variable "pv_subname" {
  description = "The private subnet to connect to VPC1"
  type        = string
  default     = "myPrivateSubnet"
}

variable "pb_rt_name" {
  description = "The name of the public subnet Route Table"
  type        = string
  default     = "pub_subnet_rt"
}

variable "pv_rt_name" {
  description = "The name of the private subnet Route Table"
  type        = string
  default     = "prv_subnet_rt"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "pv_instance_id" {
  description = "Private Instance ID"
  type        = string
  default     = "myID"
}

