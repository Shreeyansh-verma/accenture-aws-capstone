# Project 15 - Ansible Web Server Automation

## Objective
Automate the installation and configuration of Nginx
using Ansible.

## Environment
- Ansible controller: Ubuntu VM
- Managed node: Docker-based Ubuntu SSH target
- Web server: Nginx

## Implementation
The playbook:
1. Installs Nginx.
2. Creates a custom webpage.
3. Starts Nginx when required.
4. Reloads Nginx after webpage updates.
5. Verifies the application responds with HTTP 200.

## Verification
The original Ansible playbook completed successfully:
- Failed tasks: 0
- Unreachable hosts: 0
- HTTP response: 200

## Security
The original SSH access configuration and inventory
are not included in the repository.

The Dockerfile expects an authorized_keys file to be
supplied locally during the image build.
Use a trusted SSH public key, never a private key.

The Docker SSH target and passwordless sudo configuration
are intended for a local training environment, not production.
