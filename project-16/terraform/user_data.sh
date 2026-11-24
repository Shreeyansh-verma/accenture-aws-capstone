#!/bin/bash
set -euo pipefail

dnf install -y httpd

cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
  <title>Project 16 - HTTPS Deployment</title>
</head>
<body>
  <h1>Project 16 - HTTPS Deployment</h1>
  <p>EC2 web server is healthy.</p>
  <p>Deployed using Terraform on AWS.</p>
</body>
</html>
HTML

systemctl enable --now httpd
