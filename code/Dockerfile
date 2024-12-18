# Use an outdated base image
FROM ubuntu:14.04

# Install packages without specifying versions
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Copy application files
COPY . /app

# Set working directory
WORKDIR /app

# Install Python dependencies without a requirements file
RUN pip3 install flask

# Expose port (not recommended in Dockerfile)
EXPOSE 5000

# Run the application as root user (security risk)
CMD ["python3", "app.py"]