# Project 8 - Build and Run Docker App Locally

## Objective
Build and run a web application inside a Docker container.

## Technology
- Docker
- Nginx
- HTML

## Build
docker build -t capstone-project-08:1.0 .

## Run
docker run -d --name capstone-p08-web -p 127.0.0.1:8088:80 capstone-project-08:1.0

## Verification
docker ps
curl -I http://localhost:8088

## Result
The application was served successfully from an Nginx Docker container.
