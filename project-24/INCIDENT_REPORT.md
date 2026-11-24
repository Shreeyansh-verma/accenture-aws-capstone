# Project 24 - Manual Chaos Test Incident Report

## Incident Summary
A controlled service failure was simulated on a temporary
Amazon EC2 instance to evaluate manual recovery.

## Environment
- AWS Region: ap-south-1
- EC2 Instance: i-077eff2699a630f96
- Operating System: Amazon Linux 2023
- Service: project24-demo.service
- HTTP Endpoint: http://127.0.0.1:8765/
- Execution Method: AWS Systems Manager

## Incident Details
Date: 24 November 2026
Failure timestamp (UTC): 16:47:37
Recovery timestamp (UTC): 16:47:37

## Initial State
The systemd service was active.
The HTTP endpoint returned:
Project 24 service healthy

## Failure Injection
The application service was deliberately stopped using:
systemctl stop project24-demo.service

## Failure Verification
- Service became inactive.
- HTTP endpoint became unavailable.
- The failure was successfully reproduced.

## Recovery Action
The service was manually restarted using:
systemctl start project24-demo.service

## Recovery Verification
- Service returned to active status.
- HTTP endpoint responded successfully.
- The expected healthy response was restored.

## Root Cause
Intentional service shutdown during a controlled chaos test.

## Impact
The isolated test web service temporarily became unavailable.
No production service was intentionally interrupted.

## Recovery Time
Failure and recovery were recorded within the same second.
Exact recovery duration was not measured.

## Lessons Learned
1. Service availability must be verified through health checks.
2. A running EC2 instance does not guarantee application health.
3. systemd can be used to restore a stopped service.
4. AWS Systems Manager enables remote incident recovery.
5. Monitoring and automated restart policies can improve resilience.

## Final Result
Manual chaos test completed successfully.
The service was stopped, failure was verified,
and the service was restored.

SSM Command Status: Success
