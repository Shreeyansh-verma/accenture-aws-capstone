# Project 23 - IAM Role Based Access

## Objective
Securely enable an EC2 instance to access Amazon S3
using an IAM role instead of static AWS credentials.

## AWS Services
- Amazon EC2
- AWS IAM
- Amazon S3
- AWS Systems Manager
- AWS CLI

## Implementation
1. Created a dedicated EC2 IAM role.
2. Configured the EC2 trust relationship.
3. Attached AmazonSSMManagedInstanceCore.
4. Created a least-privilege S3 read-only policy.
5. Created an IAM instance profile.
6. Launched a temporary Amazon Linux 2023 EC2 instance.
7. Attached the IAM instance profile to EC2.
8. Connected using AWS Systems Manager.
9. Verified the assumed IAM role using AWS STS.
10. Listed and downloaded an archived S3 log.

## IAM Configuration
Role: shreeyansh-p23-ec2-s3-role
Instance Profile: shreeyansh-p23-ec2-s3-profile

S3 Permissions:
- s3:ListBucket restricted to logs/ prefix
- s3:GetObject restricted to logs/* objects

## Security
- No static AWS access keys configured on EC2.
- EC2 metadata service requires IMDSv2.
- No inbound security group rules.
- Access restricted to the Project 22 S3 bucket.
- Systems Manager used for remote command execution.

## Verification
SSM Command Status: Success
Downloaded File: project17-app.log
Downloaded File Size: 258 bytes
Errors: None

AWS STS confirmed that the EC2 instance assumed
shreeyansh-p23-ec2-s3-role.

## Evidence
- evidence/ssm-test-result.json
- evidence/cli-test-output.txt
- evidence/iam-profile-verification.json

## Result
Successfully demonstrated secure EC2-to-S3 access
using an IAM role without static AWS credentials.

The EC2 instance is temporary and will be removed
after the capstone tests are completed.
