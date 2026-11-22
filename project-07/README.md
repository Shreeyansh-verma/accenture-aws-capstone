# Project 7 - CI Validation for Terraform

## Goal
Automate Infrastructure as Code checks using GitHub Actions.

## Tasks
- Run terraform fmt on push
- Run terraform validate on push
- Add workflow status badge to repository README

## Implementation
GitHub Actions workflow:
.github/workflows/terraform-ci.yml

## Deliverable
Screenshot of successful GitHub Actions pipeline.

## Security
The workflow validates Terraform configuration only.
It does not execute terraform apply.
