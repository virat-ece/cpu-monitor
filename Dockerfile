# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy your Python script into the container
COPY install_and_run_stui.py .

# Install necessary packages
RUN apt-get update && \
    apt-get install -y sudo && \
    pip install --no-cache-dir s-tui && \
    apt-get clean

# Add a non-root user and add to sudoers
RUN useradd -ms /bin/bash s_tui_user && \
    echo "s_tui_user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/s_tui_user

# Switch to the new user
USER s_tui_user

# Run the Python script
CMD ["python", "install_and_run_stui.py"]

