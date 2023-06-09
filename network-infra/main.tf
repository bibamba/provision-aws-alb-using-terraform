locals {
  prefix   = "aws-alb-using-terraform"
  vpc_name = "${local.prefix}-vpc"
  vpc_cidr = "10.23.0.0/16"

  common_tags = {
    Environment = "Dev"
    Project     = "terraform-lab"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = local.vpc_name
  cidr   = local.vpc_cidr
  azs    = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 0),
    cidrsubnet(local.vpc_cidr, 8, 1)
  ]
  private_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 2),
    cidrsubnet(local.vpc_cidr, 8, 3)
  ]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = local.vpc_name
    },
    local.common_tags
  )
}