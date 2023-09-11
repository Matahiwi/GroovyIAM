variable "role_name" {
  description = "Name of the IAM role we are creating and attaching the policy to"
}

variable "policy_name" {
  description = "The name of the Policy we are creating"
}

variable "iam_trust_policy" {
  description = "Receives the trust policy from the parent module datasource"
}

variable "iam_policy_permissions" {
  description = "Holds the IAM permissions for the custom IAM Policy from the parent module datasource"
}

variable "iam_path" {
  description = "Used to inject complexity into the IAM roles ARN, path should start and end with a / "
  default     = "/"
}

variable "tag_key" {
  type    = string
  default = "Department"
}

variable "tag_value" {
  type    = string
  default = "Engineering"
}

variable "aws_tags" {
  description = "Map of tags to be used to tag policy and IAM role"
  type        = map(string)
}
