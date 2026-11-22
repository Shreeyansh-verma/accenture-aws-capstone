#!/usr/bin/env bash
set -euo pipefail

if [[ "$EUID" -ne 0 ]]; then
  echo "Run with sudo: sudo bash setup.sh"
  exit 1
fi

# Create project group
getent group capstone_p05_team >/dev/null || groupadd capstone_p05_team

# Create test users if they do not exist
for user in p05alice p05bob p05guest; do
  id "$user" >/dev/null 2>&1 || useradd -m -s /bin/bash "$user"
done

# Assign authorized group membership
usermod -aG capstone_p05_team p05alice
usermod -aG capstone_p05_team p05bob

# Configure protected shared directory
mkdir -p /srv/capstone-p05-shared
chown p05alice:capstone_p05_team /srv/capstone-p05-shared
chmod 2770 /srv/capstone-p05-shared

# Create and protect team file
if [[ ! -f /srv/capstone-p05-shared/team-notes.txt ]]; then
  echo "Confidential Project 5 team document" > /srv/capstone-p05-shared/team-notes.txt
fi

chown p05alice:capstone_p05_team /srv/capstone-p05-shared/team-notes.txt
chmod 660 /srv/capstone-p05-shared/team-notes.txt

echo "Project 5 Linux permissions configured successfully."
