provider "aws" {
  region = "ap-southeast-2"
}

module "network" {
  source = "../../../terraform/modules/network"

  cidr = "10.200.0.0/16"
  pb_cidr = "10.200.0.0/24"
  mypub_ip_address = "141.168.175.126/32"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
