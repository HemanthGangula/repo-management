# Use Ubuntu as the base image 
FROM ubuntu:latest

# Update package lists and install Git
RUN apt-get update && \
    apt-get install -y git dos2unix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Copy the Shell script from the host into the container
COPY repo-manager.sh /app/repo-manager.sh

# Set execution permissions for the Shell script
RUN chmod +x /app/repo-manager.sh

# Convert line endings of the Shell script to Unix-style
RUN dos2unix /app/repo-manager.sh

# Define the command to run the Shell script
CMD ["/app/repo-manager.sh"]
