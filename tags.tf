locals {
  tags = {
    Environment    = var.environment
    Project        = var.project_name
    ConnectionType = var.connection_type
  }
}
