#!/bin/bash

# Update system packages
sudo apt update -y
sudo apt upgrade -y

# Install Docker dependencies
sudo apt install -y ca-certificates curl gnupg

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update repository list
sudo apt update -y

# Install Docker Engine and other components
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker service and enable on boot
sudo systemctl enable docker
sudo systemctl start docker

# Allow 'ubuntu' user to run Docker without sudo
sudo usermod -aG docker ubuntu

echo "✅ Docker installed successfully on Ubuntu 24.04!"
echo "➡️ Reboot or run: newgrp docker"
