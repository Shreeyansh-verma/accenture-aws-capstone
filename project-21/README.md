# Project 21 - CloudWatch Monitoring Dashboard

## Objective
Visualize AWS infrastructure performance using
an Amazon CloudWatch dashboard.

## Infrastructure Monitored
- Project 20 EC2 Server 1
- Project 20 EC2 Server 2
- Project 20 Application Load Balancer
- AWS Region: ap-south-1

## Dashboard
Name: shreeyansh-p21-monitoring

## Monitoring Widgets
1. EC2 CPU Utilization
2. EC2 Network Traffic
3. ALB Healthy Target Count
4. ALB HTTP Request Count

## Implementation
- Generated dashboard JSON using Python.
- Retrieved EC2 and ALB identifiers from Project 20.
- Created dashboard using AWS CLI.
- Verified the dashboard in AWS CloudWatch Console.

## Verification
- Dashboard created successfully.
- Dashboard JSON validated.
- CPU and network metrics displayed.
- HealthyHostCount showed 2 healthy targets.
- ALB request activity appeared on the graph.

## Files
- build_dashboard.py: Generates dashboard JSON.
- dashboard.json: CloudWatch dashboard configuration.

## Note
The dashboard monitors the resources deployed
during Project 20. Graphs may become empty after
those resources are terminated.
