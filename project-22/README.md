# Project 22 - S3 Log Archival with Lifecycle Management

## Objective
Archive application logs in Amazon S3 and automatically
expire archived logs after 30 days.

## AWS Services Used
- Amazon S3
- AWS CLI
- S3 Lifecycle Management

## Implementation
1. Created an S3 bucket in ap-south-1.
2. Enabled all four S3 Block Public Access settings.
3. Uploaded the Project 17 application log.
4. Created a lifecycle configuration for the logs/ prefix.
5. Configured automatic object expiration after 30 days.
6. Verified the lifecycle configuration using AWS CLI.

## Configuration
- Region: ap-south-1
- Object path: logs/project17-app.log
- Lifecycle rule: expire-project22-logs-30-days
- Filter prefix: logs/
- Expiration: 30 days
- Rule status: Enabled

## Verification
The AWS CLI confirmed that:
- The application log was uploaded successfully.
- Public access blocking is enabled.
- The lifecycle rule is enabled with 30-day expiration.

## Evidence
Verification outputs are stored in evidence/.
AWS Console screenshots may also be included.

## Security
- The S3 bucket is not publicly accessible.
- AWS credentials are not stored in this repository.
- Environment-specific bucket metadata is excluded from Git.

## Result
Successfully configured S3 application log archival with
automatic expiration after 30 days.

Note: Expiration is configured; actual object removal
occurs later through the S3 lifecycle process.
