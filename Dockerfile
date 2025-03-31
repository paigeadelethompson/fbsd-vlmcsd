# Use the imported FreeBSD base image
FROM localhost/freebsd

# Bootstrap and install pkg
RUN /bin/sh -c 'pkg bootstrap -y && pkg update && pkg upgrade -y'

# Install wget
RUN pkg install -y wget

# Install build dependencies
RUN pkg install -y git gmake gcc

# Clone and build vlmcsd
RUN git clone https://github.com/Wind4/vlmcsd.git /vlmcsd && \
    cd /vlmcsd && \
    gmake

# Create directory for the binary
RUN mkdir -p /usr/local/bin

# Copy the binary to the correct location
RUN cp /vlmcsd/bin/vlmcsd /usr/local/bin/vlmcsd && \
    chmod +x /usr/local/bin/vlmcsd

# Expose the default KMS port
EXPOSE 1688

# Set the entrypoint with verbose debug output
ENTRYPOINT ["/usr/local/bin/vlmcsd", "-Dv"] 