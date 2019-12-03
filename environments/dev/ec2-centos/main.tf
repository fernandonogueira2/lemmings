provider "aws" {
  region = var.region
}

module "network" {
  source = "../network"
}

module "ec2-centos" {
  source = "../../../terraform/modules/ec2-centos"

  subnet_id = module.network.public_subnets
  ec2name = "EC2-A"
  sec_groups_id = module.network.sec_groups_id

}
