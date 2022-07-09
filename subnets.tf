data "aws_subnets" "private_default" {
  tags = {
    Type  = "Private"
    Group = "1"
  }
}

data "aws_subnets" "public_default" {
  tags = {
    Type  = "Public"
    Group = "1"
  }
}


locals {
  default_subnets = var.domain_connection_type == "public" ? data.aws_subnets.public_default : data.aws_subnets.private_default
  subnets         = length(var.domain_subnets) != 0 ? var.domain_subnets.ids : local.default_subnets.ids
}