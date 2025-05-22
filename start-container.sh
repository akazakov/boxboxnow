#!/bin/bash
set -euxo pipefail

# Configure SSH for the container
echo "Setting up SSH for the container..."

# Check if user has SSH keys
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  echo "No SSH public key found. Generating one..."
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
  echo "SSH key generated"
fi

# Create .container directory and copy SSH keys
mkdir -p .container
cp ~/.ssh/id_rsa.pub .container/authorized_keys
chmod 644 .container/authorized_keys

# Start the container with Docker Compose
echo "Starting C++ development container..."
docker-compose up -d

echo "Container started successfully!"
echo "Your SSH public key has been added to the container's authorized_keys"
echo "You can connect via SSH using: ssh -p 2223 ubuntu@localhost"
echo "Or connect using VS Code Remote SSH extension"
