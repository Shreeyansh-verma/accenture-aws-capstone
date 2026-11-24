# Project 13 - Docker Image Push to Amazon ECR

## Objective
Build a Docker image and push it to Amazon ECR.

## AWS Resources
- Region: ap-south-1
- AWS account: 590507089733
- ECR repository: capstone-project-13
- Image tag: project13-v1

## Implementation
- Created an Nginx-based Docker image.
- Pushed the image to Amazon ECR.
- Verified the image tag and digest using AWS CLI.
- Reused the ECR image in Project 14.

## Verification
Image digest:
sha256:6e5357c6a080bdd9d49d263e9b6cb94007bfc3cc44a03bcec97e15b05ac1b439

## Files
- Dockerfile: Nginx container build definition
- index.html: Application webpage

## Notes
The build files are recovered from the earlier
Project 8 Nginx application used in this capstone.
The published ECR image was verified separately.
