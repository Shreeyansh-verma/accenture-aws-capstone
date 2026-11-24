#!/usr/bin/env python3
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REGION = "ap-south-1"
PROFILE = "capstone"

def command(args, cwd=None):
    return subprocess.check_output(
        args, cwd=cwd, text=True
    ).strip()

outputs = json.loads(
    command(["terraform", "output", "-json"], ROOT / "project-20")
)

instances = outputs["ec2_instance_ids"]["value"]
target_arn = outputs["target_group_arn"]["value"]

alb_arn = command([
    "aws", "elbv2", "describe-load-balancers",
    "--names", "shreeyansh-p20-alb",
    "--query", "LoadBalancers[0].LoadBalancerArn",
    "--output", "text",
    "--region", REGION,
    "--profile", PROFILE
])

alb_dimension = alb_arn.split("loadbalancer/", 1)[1]
target_dimension = target_arn.split(":")[-1]

def widget(x, y, title, metrics, stat="Average", period=300):
    return {
        "type": "metric",
        "x": x,
        "y": y,
        "width": 12,
        "height": 7,
        "properties": {
            "title": title,
            "metrics": metrics,
            "region": REGION,
            "view": "timeSeries",
            "stacked": False,
            "stat": stat,
            "period": period
        }
    }

cpu = [
    ["AWS/EC2", "CPUUtilization", "InstanceId", instance,
     {"label": f"EC2 Server {i}"}]
    for i, instance in enumerate(instances, 1)
]

network = []
for i, instance in enumerate(instances, 1):
    for metric in ("NetworkIn", "NetworkOut"):
        network.append([
            "AWS/EC2", metric, "InstanceId", instance,
            {"label": f"Server {i} - {metric}"}
        ])

healthy = [[
    "AWS/ApplicationELB", "HealthyHostCount",
    "TargetGroup", target_dimension,
    "LoadBalancer", alb_dimension
]]

requests = [[
    "AWS/ApplicationELB", "RequestCount",
    "LoadBalancer", alb_dimension
]]

dashboard = {
    "widgets": [
        {
            "type": "text",
            "x": 0, "y": 0,
            "width": 24, "height": 2,
            "properties": {
                "markdown": "# Project 21 - CloudWatch Monitoring\nMonitoring Project 20 EC2 instances and Application Load Balancer."
            }
        },
        widget(0, 2, "EC2 CPU Utilization (%)", cpu),
        widget(12, 2, "EC2 Network Traffic (Bytes)", network, "Sum"),
        widget(0, 9, "ALB Healthy Targets", healthy, "Average", 60),
        widget(12, 9, "ALB HTTP Request Count", requests, "Sum", 60)
    ]
}

output_file = ROOT / "project-21" / "dashboard.json"
output_file.write_text(json.dumps(dashboard, indent=2) + "\n")

print("Dashboard JSON generated:", output_file)
print("EC2 instances:", ", ".join(instances))
print("ALB dimension:", alb_dimension)
print("Target group dimension:", target_dimension)
print("Dashboard widgets:", len(dashboard["widgets"]))
