
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

# Existing S3 bucket from Project 2
variable "bucket_name" {
  description = "S3 bucket to grant read access to"
  type        = string
}

# Store S3 read permissions in a variable
variable "s3_read_policy" {
  description = "Read-only S3 policy permissions"

  type = object({
    bucket_actions = list(string)
    object_actions = list(string)
  })

  default = {
    bucket_actions = ["s3:ListBucket"]
    object_actions = ["s3:GetObject"]
  }
}

# Create IAM user
resource "aws_iam_user" "s3_reader" {
  name          = "capstone-p04-s3-reader-shreeyansh"
  force_destroy = false

  tags = {
    Name    = "Capstone-Project-04"
    Project = "IAM-User-Automation"
  }
}

# Attach read-only S3 policy to the user
resource "aws_iam_user_policy" "s3_read" {
  name = "capstone-p04-s3-read"
  user = aws_iam_user.s3_reader.name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid      = "ListProjectBucket"
        Effect   = "Allow"
        Action   = var.s3_read_policy.bucket_actions
        Resource = "arn:aws:s3:::${var.bucket_name}"
      },
      {
        Sid      = "ReadProjectObjects"
        Effect   = "Allow"
        Action   = var.s3_read_policy.object_actions
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

output "iam_user_name" {
  value = aws_iam_user.s3_reader.name
}

output "iam_user_arn" {
  value = aws_iam_user.s3_reader.arn
}

output "policy_name" {
  value = aws_iam_user_policy.s3_read.name
}
