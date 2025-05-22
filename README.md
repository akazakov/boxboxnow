# C++ Development Environment

This folder contains a development container configuration for C++ development. The dev container provides a consistent, isolated environment with all necessary tools pre-installed.

## Features

- GCC/G++ compiler suite
- CMake and Make build tools
- GDB debugger
- Common C++ libraries and development tools
- VS Code C++ extensions pre-configured

## Usage in VSCode

This is general pattern, for platfrom specific instructions see below.

1. Open this folder in VS Code
2. When prompted, click "Reopen in Container"
3. The container will build and configure automatically
4. Start developing with all tools ready to use

## Windows: Opening in VSCode from WSL

To open this development environment from Windows Subsystem for Linux (WSL):

1. Make sure you have WSL installed and configured on your Windows machine
2. Install Visual Studio Code on Windows (not in WSL)
3. Install the "Remote - WSL" extension in VS Code
4. Open your WSL terminal and navigate to this project directory
5. Run `code .` to launch VS Code connected to WSL
6. When VS Code opens, it will detect the dev container configuration
7. Click "Reopen in Container" when prompted
8. The container will build inside WSL, providing a Linux-based development environment

This approach combines the benefits of WSL's Linux environment with the containerized development setup, ensuring consistent behavior across different machines.


## MacOS: aOpening in VSCode on macOS

To open this development environment on a Mac:

1. Install Docker Desktop for Mac from the [official website](https://www.docker.com/products/docker-desktop)
2. Install Visual Studio Code for Mac from the [official website](https://code.visualstudio.com/download)
3. Open VS Code and install the "Remote - Containers" extension
   - Go to Extensions (or press `Cmd+Shift+X`)
   - Search for "Remote - Containers" and install it
4. Clone this repository to your local machine
5. Open the repository folder in VS Code
   - Use `File > Open...` or press `Cmd+O`
   - Navigate to and select the repository folder
6. When VS Code detects the dev container configuration, click "Reopen in Container"
7. Wait for the container to build and configure
8. You're now ready to develop in the containerized environment

Note: The first container build may take several minutes depending on your internet connection and system performance.

## Linux: Opening in VSCode on Linux

To open this development environment on Linux:

1. Install Docker on your Linux distribution:
   - For Ubuntu/Debian: `sudo apt update && sudo apt install docker.io`
   - For Fedora: `sudo dnf install docker`
   - For other distributions, follow the [official Docker installation guide](https://docs.docker.com/engine/install/)
2. Start and enable the Docker service:
   - `sudo systemctl start docker`
   - `sudo systemctl enable docker`
3. Add your user to the Docker group to run Docker without sudo:
   - `sudo usermod -aG docker $USER`
   - Log out and log back in for the changes to take effect
4. Install Visual Studio Code from the [official website](https://code.visualstudio.com/download) or through your package manager
5. Open VS Code and install the "Remote - Containers" extension
   - Go to Extensions (or press `Ctrl+Shift+X`)
   - Search for "Remote - Containers" and install it
6. Clone this repository to your local machine
7. Open the repository folder in VS Code
   - Use `File > Open...` or press `Ctrl+O`
   - Navigate to and select the repository folder
8. When VS Code detects the dev container configuration, click "Reopen in Container"
9. Wait for the container to build and configure
10. You're now ready to develop in the containerized environment

Note: Depending on your Linux distribution, you might need to adjust the Docker installation steps. Refer to the official Docker documentation for your specific distribution if needed.

## Linux: Using Without VSCode (BYO Remote IDE)

If you prefer to use your own IDE or editor instead of VSCode, you can still take advantage of the containerized development environment:

1. Install Docker on your Linux distribution:
   - For Ubuntu/Debian: `sudo apt update && sudo apt install docker.io`
   - For Fedora: `sudo dnf install docker`
   - For other distributions, follow the [official Docker installation guide](https://docs.docker.com/engine/install/)
2. Start and enable the Docker service:
   - `sudo systemctl start docker`
   - `sudo systemctl enable docker`
3. Add your user to the Docker group to run Docker without sudo:
   - `sudo usermod -aG docker $USER`
   - Log out and log back in for the changes to take effect
4. Clone this repository to your local machine
5. Navigate to the repository folder in your terminal
6. Build and start the container using the provided scripts:
   ```bash
   # Build the container image
   ./build-image.sh
   
   # Start the container
   ./start-container.sh
   ```
   
   These scripts handle the Docker build and run commands with all the necessary configurations, ensuring that the ports exposed match those defined in the docker-compose configuration.
   
7. SSH into the container:
   ```bash
   # The SSH port is exposed as defined in the docker-compose configuration
   ssh vscode@localhost -p 2223
   ```
      
8. You can now use your preferred remote IDE or editor that supports SSH connections:
   - For JetBrains IDEs: Use the "Remote Development" feature
   - For Emacs: Use TRAMP mode
   - For Vim/Neovim: Use scp or plugins like vim-fugitive
   - For other editors: Use any SSH-based remote editing capability

Note: To stop the container when you're done, you can use `docker stop container_name` or create a stop-container.sh script for convenience.

