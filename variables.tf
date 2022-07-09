variable "project_name" {
  type        = string
  description = "The domain name for the open search project"
}

variable "instance_type" {
  type        = string
  description = "The instance type for opensearch"
  default     = "t3.small.search"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment value for the environment tag"
}

variable "connection_type" {
  type        = string
  default     = "public"
  description = "The connection type for the tag"
}

variable "security_group_id" {
  type        = string
  description = "The security group for the domain"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "supplied vpc for the domain"
  default     = ""
}

variable "engine_version" {
  type        = string
  description = "The engine version for the domain"
  default     = "1.2"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = ""
}

variable "account_id" {
  type        = string
  description = "Account id"
  default     = ""
}

variable "domain_connection_type" {
  type        = string
  description = "This controls whether or not the domain should be public or vpc access"
  default     = "public"
  validation {
    condition     = var.domain_connection_type == "public" || var.domain_connection_type == "vpc"
    error_message = "The domain_connection_type can only be public or vpc!"
  }
}

variable "domain_subnets" {
  type        = list(string)
  description = "Supplied domain subnets"
  default     = []
}

variable "domain_master_username" {
  type        = string
  description = "The domain master username"
}

variable "domain_master_user_password" {
  type        = string
  description = "The domain master user password"
}

variable "dedicated_master_count" {
  type        = number
  default     = 0
  description = "The dedicated master count, which was with master enabled"
}

variable "dedicated_master_enabled" {
  type        = bool
  default     = false
  description = "Turn off/on the dedicated master"
}

variable "dedicated_master_type" {
  type        = string
  default     = ""
  description = "The instance type for the master node, should be used with dedicated_master_enabled"
}

variable "instance_count" {
  type        = number
  default     = 3
  description = "The instance/node count which should be multiples of 3"
  validation {
    condition     = var.instance_count % 3 == 0
    error_message = "It should be a multiple of 3"
  }
  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 10
    error_message = "It should be between 1 and 10"
  }
}

variable "certificate_arn" {
  type        = string
  default     = ""
  description = "The certificate arn for the custom endpoint"
}

variable "custom_endpoint_enabled" {
  type        = bool
  default     = false
  description = "Control whether or not the custom endpoint is enabled"
}

variable "volume_size" {
  type        = number
  description = "size of the EBS"
  default     = 10
  validation {
    condition     = var.volume_size >= 10
    error_message = "It should be at least 10 GiB"
  }
}
