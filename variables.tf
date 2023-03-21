variable "prefix" {
  default = "aws-alb-using-terraform"
  description = "Common prefix for the resources"
}

variable "aws_region" {
  default = "us-east-1"
  description = "AWS Region for VPC"
}