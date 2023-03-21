locals {
  prefix = "aws-alb-using-terraform"
  vpc_name = "${local.prefix}-vpc"
  vpc_cidr = "10.23.0.0/16"
  common_tags {
    Environment = "Dev"
    Project = "terraform-lab"
  }
}