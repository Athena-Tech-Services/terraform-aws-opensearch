data "aws_security_group" "default_sg" {
  count  = var.security_group_id == "" ? 1 : 0
  vpc_id = local.vpc.id
  name   = "default"

}


locals {
  sg = var.security_group_id != "" ? var.security_group_id : data.aws_security_group.default_sg
}
