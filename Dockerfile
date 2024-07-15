# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Add missing GPG keys
RUN apt-get update && apt-get install -y gnupg2 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
    0E98404D386FA1D9 6ED0E7B82643E131 54404762BBB6E853 BDE6D2B9216EC7A8 && \
    apt-get update

# Install necessary packages
RUN apt-get install -y sudo && \
    pip install --no-cache-dir s-tui && \
    apt-get clean

# Copy your Python scripts into the container
COPY install_and_run_stui.py .

# Run your script or any other commands as needed
CMD ["python", "install_and_run_stui.py"]

