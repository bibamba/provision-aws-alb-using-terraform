output "prefix" {
  value       = local.prefix
  description = "Exported Common Resources prefix"
}

output "common_tags" {
  value       = local.common_tags
  description = "Exported Common resources tags"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"

}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "VPC public subnets' IDs list"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "VPC private subnets' IDs list"
}