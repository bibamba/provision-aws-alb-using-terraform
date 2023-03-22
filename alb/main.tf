locals {
  remote_state_bucket_region = "us-east-1"
  remote_state_bucket = "alb-terraform-remote-state"
  network_infra_state_file = "network-infra/terraform.tfstate"
  prefix = data.terraform_remote_state.network-infra.outputs.prefix
  common_tags = data.terraform_remote_state.network-infra.outputs.common_tags
  vpc_id = data.terraform_remote_state.network-infra.outputs.vpc_id
  public_subnets = data.terraform_remote_state.network-infra.outputs.public_subnets
  private_subnets = data.terraform_remote_state.network-infra.outputs.private_subnets
}

data "terraform_remote_state" "network-infra" {
    backend = "s3"
    config = {
      bucket = local.remote_state_bucket
      region = local.remote_state_bucket_region 
      key = local.network_infra_state_file 
     }
}

## -----------------------------------------------------------------
##################### ALB Security Group
## -----------------------------------------------------------------
module "alb_sg" {
  source = "terraform-aws-modules/security-group/aws"
  name = "${local.prefix}-alb-sg"
  description = "ALB's Security Group"
  vpc_id = local.vpc_id
  egress_rules = ["all-all"]
}

## -----------------------------------------------------------------
#####################  ALB 
## -----------------------------------------------------------------
resource "aws_lb" "internet-facing-lb" {
  name = "${local.prefix}-alb"
  subnets = local.public_subnets
  security_groups = [module.alb_sg.security_group_id]

  tags = merge (
    {
        Name = "${local.prefix}-alb"
    },
    local.common_tags
  )
}