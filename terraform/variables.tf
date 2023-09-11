variable "role_name" {
  description = "Name of the IAM role we are creating and attaching the policy to"
  type        = string
  default     = "TauputaTerraformIAMRole"
}

variable "policy_name" {
  description = "The name of the Policy we are creating"
  type        = string
  default     = "TauputaTerraformIAMPolicy"
}

variable "iam_path" {
  description = "Used to inject complexity into the IAM roles and policy ARN, path should start and end with a /"
  # currently module is set up to use the same path for the policy and role
  # Leave this at the default of "/" to mimic creating roles and policies with AWS Console (ie GUI).
  default = "/"
}

variable "aws_tags" {
  description = "Map of tags to be used to tag policy and IAM role"
  type        = map(string)
  default = {
    "Department"  = "Engineering"
    "Environment" = "Production"
    "Team"        = "DevOps"
  }
}
