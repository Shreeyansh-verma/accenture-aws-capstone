
terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "gitops_demo" {
  input = {
    project       = "project-18"
    environment   = "development"
    deployment    = "github-actions"
    trigger       = "merged-pull-request"
    configuration = "v1"
  }
}

output "deployment_status" {
  value = "Project 18 Terraform apply completed"
}
