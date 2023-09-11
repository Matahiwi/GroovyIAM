output "policy_arn" {
  description = "return the policy arn"
  value       = module.iam.policy_arn
}

output "iam_role_arn" {
  description = "return the iam role arn"
  value       = module.iam.iam_role_arn
}


