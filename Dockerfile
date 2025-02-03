# Use a later official Node.js image as a base
FROM node:18

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    nfs-common \
    && rm -rf /var/lib/apt/lists/*

# Download and install VS Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Create the mount point and set permissions
RUN mkdir /mnt/gray && chmod 777 /mnt/gray

# Copy the mount script into the container
COPY mount_nfs.sh /usr/local/bin/mount_nfs.sh

# Make the script executable
RUN chmod +x /usr/local/bin/mount_nfs.sh

# Set the working directory
WORKDIR /mnt/gray

# Expose the port that code-server runs on
EXPOSE 8080

# Set the command to run code-server
CMD ["code-server", "--host", "0.0.0.0", "--port", "8080", "--auth", "none"]

# Set the command to run the mount script and then code-server
CMD ["/bin/bash", "-c", "/usr/local/bin/mount_nfs.sh && code-server --host 0.0.0.0 --port 8080 --auth none --user-data-dir /tobe/provided/.vscode --open /mnt/gray"]