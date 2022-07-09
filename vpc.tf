data "aws_vpc" "supplied_vpc" {
  count = var.vpc_id != "" ? 1 : 0
  id    = var.vpc_id
}

data "aws_vpc" "default_vpc" {
  count   = var.vpc_id == "" ? 1 : 0
  default = true
}

locals {
  vpc = var.vpc_id != "" ? data.aws_vpc.supplied_vpc : data.aws_vpc.default_vpc
}
