data "aws_iam_policy_document" "secret_manager_permissions" {
  # data source containing the permissions used the iam custom policy
  statement {
    sid    = "ReadSquadSecrets"
    effect = "Allow"

    resources = [
      "arn:aws:ssm:ap-southeast-2:969296761654:parameter/core/*",
      "arn:aws:secretsmanager:ap-southeast-2:969296761654:secret:/core/*",
    ]

    actions = [
      "ssm:GetParameter",
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:GetSecretValue",
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:DescribeSecret",
    ]
  }
}

data "aws_iam_policy_document" "iam_role_trust_relationship" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::969296761654:root"]
    }
  }
}
