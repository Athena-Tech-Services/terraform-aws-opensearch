resource "aws_opensearch_domain" "domain" {
  domain_name    = var.project_name
  engine_version = "OpenSearch_1.2"

  cluster_config {
    instance_type            = var.instance_type
    dedicated_master_count   = var.dedicated_master_count
    dedicated_master_enabled = var.dedicated_master_enabled
    dedicated_master_type    = var.dedicated_master_type
    instance_count           = var.instance_count
    zone_awareness_enabled   = true
    zone_awareness_config {
      availability_zone_count = 3
    }
  }

  domain_endpoint_options {
    custom_endpoint_certificate_arn = var.certificate_arn
    custom_endpoint_enabled         = var.custom_endpoint_enabled
    enforce_https                   = true
    tls_security_policy             = "Policy-Min-TLS-1-2-2019-07"
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.ebs_volume_size

  }

  advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = var.domain_master_username
      master_user_password = var.domain_master_user_password
    }
  }

  auto_tune_options {
    desired_state = "ENABLED"
  }

  dynamic "vpc_options" {
    for_each              = var.domain_connection_type[*]
    content{
      security_group_ids = [local.sg]
      subnet_ids         = [local.subnets]
    }
    
  }

  depends_on = [
    aws_iam_service_linked_role.service_role
  ]

  tags = local.tags
}
