
# The original Dockerfile did not contain the proper instructions to install curl, which is needed for the HEALTHCHECK.
# I added the necessary command to install curl before the HEALTHCHECK instruction.

FROM python:3.8-slim-buster

# Updating and upgrading the packages
RUN apt-get update && apt-get upgrade -y

# Installing git
RUN apt-get install git -y

# Copying the requirements file
COPY requirements.txt /requirements.txt

# Installing the requirements
RUN pip install -r requirements.txt

# Creating a directory for the application
RUN mkdir /DQ_The_File_Donor

# Setting the working directory
WORKDIR /DQ_The_File_Donor

# Copying all the files and directories to the working directory
COPY . .

# Exposing port 80
EXPOSE 80

# Installing curl
RUN apt-get update && apt-get install -y curl  # Fixed command order and added missing 'update' command

# Healthcheck to test if the app is running
HEALTHCHECK --interval=5s CMD curl -f http://localhost:80/ || exit 1

# Delaying the execution of the Python script to allow time for the application to start
CMD sleep 10 && python bot.py
