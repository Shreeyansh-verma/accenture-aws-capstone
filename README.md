[![Terraform CI](https://github.com/Shreeyansh-verma/accenture-aws-capstone/actions/workflows/terraform-ci.yml/badge.svg?branch=main)](https://github.com/Shreeyansh-verma/accenture-aws-capstone/actions/workflows/terraform-ci.yml)


# Project 1: Linux EC2 Web Server using Terraform

## Objective
Deploy an Apache web server on AWS EC2 using Terraform.

## Technologies
- AWS EC2
- Terraform
- Amazon Linux 2023
- Apache HTTP Server
- Bash

## Infrastructure
- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

## Implementation
1. Created AWS infrastructure using Terraform.
2. Used a Bash user-data script to install Apache.
3. Configured HTTP access on port 80.
4. Hosted an HTML webpage.
5. Verified the website using curl.

## Verification
The web server returned HTTP 200 OK.

## Result
Successfully deployed a Linux EC2 web server
using Infrastructure as Code.
