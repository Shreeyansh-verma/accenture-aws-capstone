terraform {
  required_version = ">= 1.5.0"
}

variable "project_name" {
  description = "Name of the capstone project"
  type        = string
  default     = "project-06"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

output "common_tags" {
  description = "Reusable tags for AWS resources"
  value       = local.common_tags
}
