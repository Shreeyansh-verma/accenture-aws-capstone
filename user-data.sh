#!/bin/bash
set -euxo pipefail

# Install Apache web server
dnf install -y httpd

# Enable and start Apache
systemctl enable --now httpd

# Create HTML webpage
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Accenture AWS Capstone</title>
</head>
<body style="text-align:center; font-family:Arial; padding:50px;">
    <h1>Accenture AWS Capstone Project 1</h1>
    <h2>Linux EC2 Web Server using Terraform</h2>
    <p>Apache Web Server is Running Successfully!</p>
</body>
</html>
EOF

systemctl restart httpd
