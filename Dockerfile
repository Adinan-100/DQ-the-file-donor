
FROM python:3.8-slim-buster

# Update and upgrade the system packages
RUN apt-get update && apt-get upgrade -y

# Install git
RUN apt-get install git -y

# Copy the requirements file
COPY requirements.txt /requirements.txt

# Install the required dependencies
RUN pip install -r requirements.txt

# Create a directory for the application
RUN mkdir /DQ_The_File_Donor

# Set the working directory
WORKDIR /DQ_The_File_Donor

# Copy the application code
COPY . .

# Expose port 80
EXPOSE 80

# Install curl
RUN apt-get install curl -y

# Add a healthcheck command to ensure the application is healthy
HEALTHCHECK --interval=5s CMD curl -f http://localhost:80/ || exit 1

# Define the command to run the application
CMD sleep 10 && python bot.py
