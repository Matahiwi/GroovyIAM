data "aws_iam_policy_document" "bucket_permissions" {
  # data source containing the permissions used the iam custom policy
  statement {
    sid    = "bucket_read_access"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::harriett789"
    ]

    actions = [
      "s3:GetAccountPublicAccessBlock",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
      "s3:GetBucketPolicyStatus",
      "s3:GetBucketPublicAccessBlock",
      "s3:ListAccessPoints",
      "s3:ListAllMyBuckets"
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
