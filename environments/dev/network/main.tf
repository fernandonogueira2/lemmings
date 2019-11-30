provider "aws" {
  region = "ap-southeast-2"
}

module "network" {
  source = "../../../terraform/modules/network"

  vpc_name = "myVPC1"
  cidr = "10.200.0.0/16"
  igw_name = "myIGW1"
  pb_subname = "myPublicSubnet"
  pb_cidr = "10.200.0.0/24"
  rt_name = "pub_subnet_rt"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
