#!/bin/bash
set -euxo pipefail

dnf install -y nginx

cat > /usr/share/nginx/html/index.html <<HTML
<!DOCTYPE html>
<html>
<head>
  <title>Project 20 Load Balancing</title>
</head>
<body style="font-family:Arial;text-align:center;padding:80px;">
  <h1>Accenture Capstone - Project 20</h1>
  <h2>Server: ${server_name}</h2>
  <p>Application Load Balancer demonstration</p>
  <p>Status: Healthy</p>
</body>
</html>
HTML

systemctl enable --now nginx
