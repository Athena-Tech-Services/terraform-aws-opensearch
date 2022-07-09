data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

locals {
  aws_region     = var.region == "" ? data.aws_region.current.name : var.region
  aws_account_id = var.account_id == "" ? data.aws_caller_identity.current.account_id : var.account_id
}