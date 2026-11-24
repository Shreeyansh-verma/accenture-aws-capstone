# Project 19 - Scheduled S3 Backup

## Objective
Automate the backup of application logs to Amazon S3
using a Linux cron job and AWS CLI.

## Implementation
- Source: Project 17 application log
- Destination: Private Amazon S3 bucket
- AWS Region: ap-south-1
- AWS CLI Profile: capstone
- Scheduler: Linux cron
- Schedule: Daily at 03:30 UTC (09:00 IST)
- Backup naming: UTC timestamp-based
- Encryption: SSE-S3 (AES256)

## Files
- backup-logs.sh: Automated backup script
- .gitignore: Excludes the local bucket configuration

## Setup
1. Install and configure AWS CLI with profile capstone.
2. Create a private S3 bucket.
3. Save the bucket name to project-19/.bucket-name.
4. Ensure the Project 17 application log exists.
5. Grant execute permission to backup-logs.sh.
6. Configure the cron job to run the script daily.

## Verification
- Backup script executed successfully.
- Manual S3 upload verified.
- Automatic cron uploads verified.
- S3 objects confirmed using AWS CLI.
- S3 object encryption confirmed as AES256.

## Notes
The cron job operates only while the Ubuntu VM
is running. AWS credentials and runtime logs are
not included in the GitHub repository.
