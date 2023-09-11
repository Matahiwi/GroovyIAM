output "policy_arn" {
  description = "return the policy arn"
  value       = aws_iam_policy.iam_secret_manager.arn
}

output "iam_role_arn" {
  description = "return the iam role arn"
  value       = aws_iam_role.secret_manager_iam_role.arn
}
