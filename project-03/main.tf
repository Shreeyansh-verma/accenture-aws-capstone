
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

variable "instance_id" {
  description = "Existing EC2 instance from Project 1"
  type        = string
}

# CloudWatch CPU Utilization Alarm
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name        = "capstone-project-03-cpu-high-${var.instance_id}"
  alarm_description = "Alarm when EC2 average CPU exceeds 25 percent"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 1
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 300
  statistic          = "Average"
  threshold          = 25

  dimensions = {
    InstanceId = var.instance_id
  }

  treat_missing_data = "notBreaching"

  tags = {
    Name    = "Capstone-Project-03"
    Project = "EC2-CPU-Monitoring"
  }
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_high.alarm_name
}

output "monitored_instance_id" {
  value = var.instance_id
}
