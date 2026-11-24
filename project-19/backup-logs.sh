#!/usr/bin/env bash
set -euo pipefail

AWS_BIN="/home/clouduser/.local/bin/aws"
SOURCE="/home/clouduser/aws-capstone/project-17/project17-app.log"
PROJECT_DIR="/home/clouduser/aws-capstone/github-upload/project-19"
RUNTIME_DIR="/home/clouduser/aws-capstone/project-19"
REGION="ap-south-1"
PROFILE="capstone"

mkdir -p "$RUNTIME_DIR"

if [[ ! -s "$SOURCE" ]]; then
    echo "ERROR: Source log is missing or empty"
    exit 1
fi

if grep -Eiq 'AKIA[0-9A-Z]{16}|ASIA[0-9A-Z]{16}|aws_secret_access_key|PRIVATE KEY' "$SOURCE"; then
    echo "ERROR: Possible credentials detected in log"
    exit 1
fi

BUCKET=$(cat "$PROJECT_DIR/.bucket-name")

TIMESTAMP=$(date -u +%Y%m%dT%H%M%SZ)
DATE_PATH=$(date -u +%Y/%m/%d)
KEY="scheduled-backups/$DATE_PATH/project17-app-$TIMESTAMP-$$.log"

echo "Starting backup: $TIMESTAMP"

"$AWS_BIN" s3 cp "$SOURCE" "s3://$BUCKET/$KEY" \
    --profile "$PROFILE" \
    --region "$REGION" \
    --only-show-errors

"$AWS_BIN" s3api head-object \
    --bucket "$BUCKET" \
    --key "$KEY" \
    --profile "$PROFILE" \
    --region "$REGION" >/dev/null

echo "$KEY" > "$RUNTIME_DIR/last-backup-key"

echo "SUCCESS: Backup uploaded and verified"
echo "S3 location: s3://$BUCKET/$KEY"
