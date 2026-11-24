FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-server python3 sudo && \
    useradd -m -s /bin/bash ansible && \
    mkdir -p /run/sshd /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    echo 'ansible ALL=(ALL) NOPASSWD:ALL' \
    > /etc/sudoers.d/ansible && \
    chmod 440 /etc/sudoers.d/ansible && \
    rm -rf /var/lib/apt/lists/*

COPY authorized_keys /home/ansible/.ssh/authorized_keys

RUN chown -R ansible:ansible /home/ansible/.ssh && \
    chmod 600 /home/ansible/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
