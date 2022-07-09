locals {
  tags = {
    Environment    = var.environment
    Project        = var.project_name
    ConnectionType = var.domain_connection_type
  }
}
