terraform {
  required_version = ">= 1.5.0"
}

variable "environment" {
  description = "Target deployment environment"
  type        = string
  default     = "development"
}

resource "terraform_data" "plan_demo" {
  input = {
    project     = "project-12"
    environment = var.environment
    managed_by  = "Terraform CI"
  }
}

output "deployment_environment" {
  value = var.environment
}
