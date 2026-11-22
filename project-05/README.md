# Project 5 - Linux Users, Groups and Permissions

## Objective
Demonstrate Linux user management, group membership,
file ownership and access permissions.

## Environment
Ubuntu 24.04 LTS

## Users
- p05alice: Authorized team member
- p05bob: Authorized team member
- p05guest: Unauthorized test user

## Group
capstone_p05_team

## Permissions
Directory: /srv/capstone-p05-shared
Directory mode: 2770
File: team-notes.txt
File mode: 660

## Setup
sudo bash setup.sh

## Verification
getent group capstone_p05_team
sudo ls -ld /srv/capstone-p05-shared
sudo ls -l /srv/capstone-p05-shared

sudo -u p05alice cat /srv/capstone-p05-shared/team-notes.txt
sudo -u p05bob cat /srv/capstone-p05-shared/team-notes.txt
sudo -u p05guest cat /srv/capstone-p05-shared/team-notes.txt

## Results
- Alice successfully read the protected file.
- Bob successfully modified the protected file.
- Guest received Permission denied.

Conclusion: Linux file ownership and group-based
access restrictions were verified successfully.
