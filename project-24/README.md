# Project 24 - Manual Chaos Test

## Objective
Simulate a service failure and demonstrate
successful manual recovery.

## AWS Services
- Amazon EC2
- AWS Systems Manager
- AWS CLI

## Implementation
1. Created an isolated Python HTTP service.
2. Managed the service using systemd.
3. Verified initial service health.
4. Stopped the service to simulate failure.
5. Confirmed service and HTTP unavailability.
6. Restarted the service.
7. Verified successful recovery.

## Test Environment
- Region: ap-south-1
- Service: project24-demo.service
- Port: 8765
- EC2: Temporary test instance

## Test Results
- Initial state: Healthy
- Failure detected: Yes
- HTTP unavailable during failure: Yes
- Service restarted: Yes
- Recovery verified: Yes
- SSM command status: Success
- Response code: 0

## Deliverables
- INCIDENT_REPORT.md
- evidence/baseline-verification.json
- evidence/chaos-test-output.txt
- evidence/chaos-test-result.json

## Result
Successfully simulated and recovered from
a controlled application service failure.

No production application was intentionally affected.
