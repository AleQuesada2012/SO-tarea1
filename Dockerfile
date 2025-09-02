# Use a minimal Linux distro
FROM ubuntu:22.04

# Install basic utilities and build essentials
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    vim \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (optional, safer)
RUN useradd -m rustuser
USER rustuser
WORKDIR /home/rustuser

# Copy your cross-compiled binaries if you want them ready
COPY target/x86_64-unknown-linux-gnu/release/rastreador ./rastreador

# Start a shell by default
CMD ["/bin/bash"]
