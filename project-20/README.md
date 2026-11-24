# Project 20 - Load Balanced Application Deployment

## Objective
Deploy two EC2 web servers behind an AWS Application
Load Balancer with health checks.

## Infrastructure
- AWS Region: ap-south-1
- Two Amazon Linux 2023 EC2 instances
- Instance type: t3.micro
- Two Availability Zones
- Nginx web servers
- Application Load Balancer
- HTTP listener on port 80
- Target group with HTTP health checks

## Implementation
1. Created separate security groups for ALB and EC2.
2. Deployed two EC2 instances using Terraform.
3. Installed Nginx using EC2 user data.
4. Created an Application Load Balancer.
5. Registered both instances in the target group.
6. Configured HTTP health checks on /.
7. Verified both targets reported healthy.
8. Tested ALB request distribution across both servers.

## Verification
Terraform apply completed successfully:
9 added, 0 changed, 0 destroyed.

Both registered targets reported healthy.

Twelve HTTP requests successfully reached both EC2 servers.

## Files
- main.tf: Terraform infrastructure configuration
- user-data.sh: EC2 Nginx initialization
- .terraform.lock.hcl: Provider dependency lock file

## Important
Terraform state is stored locally and excluded from Git.
The running AWS resources may incur charges.
Destroy only this project's Terraform-managed resources
when the assessment evidence is complete.
