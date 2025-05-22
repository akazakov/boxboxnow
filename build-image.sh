#!/bin/bash

# Build the Docker image locally
echo "Building C++ development container image..."
docker build -t cpp-dev-container -f .devcontainer/Dockerfile .

echo "Image built successfully as 'cpp-dev-container'"
