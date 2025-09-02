# DarkGhost Node Dockerfile
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV DARKGHOST_VERSION=1.0.0

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    libssl-dev \
    libzmq3-dev \
    libunbound-dev \
    libsodium-dev \
    libreadline-dev \
    libhidapi-dev \
    libprotobuf-dev \
    protobuf-compiler \
    && rm -rf /var/lib/apt/lists/*

# Create darkghost user
RUN useradd -ms /bin/bash darkghost

# Set working directory
WORKDIR /home/darkghost

# Copy source code
COPY . /home/darkghost/darkghost

# Change ownership
RUN chown -R darkghost:darkghost /home/darkghost

# Switch to darkghost user
USER darkghost

# Build DarkGhost
WORKDIR /home/darkghost/darkghost
RUN mkdir build && cd build && cmake .. && make

# Create directories for runtime
RUN mkdir -p /home/darkghost/.darkghost/{wallets,logs}

# Expose ports
EXPOSE 31313 31314

# Set entrypoint
ENTRYPOINT ["/home/darkghost/darkghost/build/darkghostd"]

# Default command
CMD ["--config-file", "/home/darkghost/.darkghost/darkghost.conf"]
