FROM ubuntu:24.04

USER root


# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    ca-certificates \
    clang \
    clang-format \
    clang-tidy \
    cmake \
    cppcheck \
    curl \
    g++ \
    gcc \
    gdb \
    git \
    libomp-dev \
    linux-tools-aws \
    llvm \
    locales \
    ninja-build \
    openssh-server \
    pkg-config \
    ripgrep \
    sudo \
    tar \
    unzip \
    valgrind \
    zip \
    && apt-get clean -y

#&& rm -rf /var/lib/apt/lists/*

# Set up locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir /var/run/sshd
RUN ssh-keygen -A

EXPOSE 22

# Configure SSH
RUN mkdir -p /run/sshd \
    && echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && echo "PermitRootLogin no" >> /etc/ssh/sshd_config


# Create ubuntu user with sudo privileges
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu && \
    chmod 0440 /etc/sudoers.d/ubuntu

USER ubuntu

# Set up SSH authorized keys directory
RUN mkdir -p /home/ubuntu/.ssh && \
    chmod 700 /home/ubuntu/.ssh

## VCPKG Bootstrapping
ENV VCPKG_HOME=/vcpkg_home
RUN sudo mkdir $VCPKG_HOME
RUN sudo chown -R ubuntu $VCPKG_HOME
RUN echo $VCPKG_HOME

# Copy vcpkg manifest file and install dependencies
# COPY vcpkg.json $VCPKG_HOME/
# RUN git clone --branch 2025.02.14 https://github.com/Microsoft/vcpkg.git $VCPKG_HOME/vcpkg
# RUN cd $VCPKG_HOME && sh $VCPKG_HOME/vcpkg/bootstrap-vcpkg.sh && $VCPKG_HOME/vcpkg/vcpkg install


# Fix permissions for SSH directory
USER root
RUN mkdir -p /home/ubuntu/.ssh && \
    chown -R ubuntu:ubuntu /home/ubuntu/.ssh && \
    chmod 700 /home/ubuntu/.ssh

# We'll use CMD instead of ENTRYPOINT to allow override from docker-compose
CMD ["/usr/sbin/sshd", "-D"]
