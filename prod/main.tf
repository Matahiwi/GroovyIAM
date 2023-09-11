provider "aws" {
  region              = "ap-southeast-2"
  allowed_account_ids = ["969296761654"]
  default_tags {
    tags = {
      Terraform = "true"
      Owner     = "Alistair"
    }
  }
}

terraform {
  required_version = "> 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
  backend "s3" {
#    bucket = "harriett789"
#    key    = "prod/tools/iam-terraform.tfstate"
    region = "ap-southeast-2"
  }
}

module "iam" {
  source      = "./modules/iam"
  policy_name = var.policy_name
  role_name   = var.role_name
  iam_path    = var.iam_path
  aws_tags    = var.aws_tags
  # Pass trust relationship from datasource to module as a variable
  iam_trust_policy = data.aws_iam_policy_document.iam_role_trust_relationship.json
  # Pass the IAM permissions from datasource to module as a variable
  iam_policy_permissions = data.aws_iam_policy_document.bucket_permissions.json
}
