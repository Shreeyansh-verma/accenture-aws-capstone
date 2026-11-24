# Project 14 - Kubernetes Deployment on Amazon EKS

## Objective
Deploy a containerized Nginx web application using Kubernetes.

## Implementation
- Used an existing shared EKS cluster.
- Created a dedicated namespace: capstone-p14.
- Deployed an Nginx container from Amazon ECR.
- Configured a Kubernetes LoadBalancer Service.
- Verified that the application responded with HTTP 200.

## Files
- namespace.yaml: Kubernetes namespace
- deployment.yaml: Nginx deployment using the Project 13 ECR image
- service.yaml: LoadBalancer service

## Deployment Commands
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

## Verification
kubectl get deployments -n capstone-p14
kubectl get pods -n capstone-p14
kubectl get services -n capstone-p14

## Important
An existing shared EKS cluster was used.
This project does not claim to have provisioned a new EKS cluster.
