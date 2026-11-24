# Project 16 - HTTPS Deployment Investigation

## Objective
Enable HTTPS using AWS Certificate Manager
and an Application Load Balancer.

## Work Performed
- Inspected existing ACM certificates.
- Examined ALB listeners and certificates.
- Investigated AWS IAM permissions.
- Checked Route 53 hosted zones.
- Reviewed HTTPS listener requirements.

## Limitations
- No trusted domain was available for validation.
- An independent HTTPS deployment was not completed.
- Existing shared ALBs were not modified.

## Status
Incomplete - implementation requires approved
infrastructure access and a suitable TLS certificate.

## Important
This folder documents the investigation only.
It does not claim successful HTTPS deployment.

## Terraform Implementation

An independent Terraform configuration has been prepared
for the intended HTTPS deployment.

### Infrastructure Defined
- Amazon Linux 2023 EC2 web server
- Apache HTTP Server
- Application Load Balancer
- ALB and EC2 security groups
- HTTP target group and health checks
- HTTPS listener on port 443
- HTTP to HTTPS redirect
- ACM certificate ARN input variable

### Terraform Files
- terraform/versions.tf
- terraform/variables.tf
- terraform/main.tf
- terraform/outputs.tf
- terraform/user_data.sh

### Validation
Terraform initialization completed successfully.
Terraform formatting and validation passed.

Evidence:
- evidence/terraform-validation.txt

### Deployment Status
Infrastructure configuration prepared and validated.

Live deployment remains pending because the training
account previously denied required ALB operations,
and an approved ACM certificate is not yet available.

No existing shared load balancers or certificates
were modified.

### Next Steps
1. Obtain authorization for ALB resource creation.
2. Obtain an approved TLS certificate and domain.
3. Review and apply Terraform.
4. Verify ALB target health and HTTPS connectivity.
5. Record deployment evidence.

## Terraform Implementation

An independent Terraform configuration has been prepared
for the intended HTTPS deployment.

### Infrastructure Defined
- Amazon Linux 2023 EC2 web server
- Apache HTTP Server
- Application Load Balancer
- ALB and EC2 security groups
- HTTP target group and health checks
- HTTPS listener on port 443
- HTTP to HTTPS redirect
- ACM certificate ARN input variable

### Terraform Files
- terraform/versions.tf
- terraform/variables.tf
- terraform/main.tf
- terraform/outputs.tf
- terraform/user_data.sh

### Validation
Terraform initialization completed successfully.
Terraform formatting and validation passed.

Evidence:
- evidence/terraform-validation.txt

### Deployment Status
Infrastructure configuration prepared and validated.

Live deployment remains pending because the training
account previously denied required ALB operations,
and an approved ACM certificate is not yet available.

No existing shared load balancers or certificates
were modified.

### Next Steps
1. Obtain authorization for ALB resource creation.
2. Obtain an approved TLS certificate and domain.
3. Review and apply Terraform.
4. Verify ALB target health and HTTPS connectivity.
5. Record deployment evidence.
