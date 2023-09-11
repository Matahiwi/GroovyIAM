resource "aws_iam_policy" "iam_secret_manager" {
  # Creates a custom IAM Policy using the supplied IAM permissions from parent module datasource
  name        = var.policy_name
  description = "Policy allowing access to secret manager"
  path        = var.iam_path               # used to add complexity to the IAM policy ARN 
  policy      = var.iam_policy_permissions # passed from parent modules datasource
  tags        = merge(var.aws_tags)
}

resource "aws_iam_role" "secret_manager_iam_role" {
  # Create an IAM Role attaching trust relationship permissions from parent module datasource
  # Then attaches the Custom Policy created within this module

  path                = var.iam_path         # used to add complexity to the IAM Roles ARN
  assume_role_policy  = var.iam_trust_policy # attaches trust policies from parent mods datasource
  name                = var.role_name
  managed_policy_arns = [aws_iam_policy.iam_secret_manager.arn]
  tags                = merge(var.aws_tags)
}
