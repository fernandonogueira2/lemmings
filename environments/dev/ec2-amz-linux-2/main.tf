provider "aws" {
  region = var.region
}

module "network" {
  source = "../network"
}

module "ec2-amz-linux-2" {
  source = "../../../terraform/modules/ec2-amz-linux-2"

  pb_subnet_id = module.network.public_subnets
  pb_sec_groups_id = module.network.pb_sec_groups_id
  pv_subnet_id = module.network.private_subnets
  pv_sec_groups_id = module.network.pv_sec_groups_id
}
