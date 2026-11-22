terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_cloudwatch_log_group" "review_demo" {
  name              = "/capstone/project-11/infra-change"
  retention_in_days = 7

  tags = {
    Project   = "11"
    ManagedBy = "Terraform"
    Purpose   = "Branching-Policy-Demo"
  }
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.review_demo.name
}
