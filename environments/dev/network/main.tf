provider "aws" {
  region = "ap-southeast-2"
}

module "vpc" {
  source = "../../../terraform/modules/network"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
