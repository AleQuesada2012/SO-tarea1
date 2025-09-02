# Force amd64 arch so everything matches your cross build target
FROM --platform=linux/amd64 rust:1.80-slim

# Install useful build + debugging tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc g++ make gdb strace lldb \
        ca-certificates pkg-config \
        libssl-dev git curl vim && \
    rm -rf /var/lib/apt/lists/*

# Create a user so you're not root inside
RUN useradd -ms /bin/bash dev
USER dev
WORKDIR /home/dev

# By default drop into bash
CMD ["/bin/bash"]
