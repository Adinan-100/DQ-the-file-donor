FROM python:3.8-slim-buster

# Update and upgrade the system packages

RUN apt update && apt upgrade -y

# Install Git

RUN apt install git -y

# Copy the requirements.txt file to the container

COPY requirements.txt /requirements.txt

# Install the Python dependencies

RUN pip install -r requirements.txt

# Create a directory for the application

RUN mkdir /DQ-The-File-Donor

# Set the working directory to the application directory

WORKDIR /DQ-The-File-Donor

# Copy the application code to the container

COPY . .

# Expose port 80 for the application

EXPOSE 80

# Install curl for healthcheck

RUN apt install curl -y

# Healthcheck command to ensure the application is running

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:80/ || exit 1

# Specify the command to run the application

CMD ["python", "bot.py"]
