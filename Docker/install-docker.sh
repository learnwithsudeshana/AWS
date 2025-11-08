#!/bin/bash

# Update system packages
sudo dnf update -y

# Install Docker
sudo dnf install -y docker

# Start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Allow ec2-user to run Docker without sudo
sudo usermod -aG docker ec2-user

echo "✅ Docker installed Successfully on Amazon Linux 2023!"
echo "➡️ Reboot or run: newgrp docker"




