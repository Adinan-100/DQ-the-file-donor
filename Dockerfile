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
RUN apt-get install -y curl  # Removed the unnecessary 'update' command since it was already run before

# Healthcheck to test if the app is running
# The app was not turning healthy after several checks because the healthcheck was attempting to access
# the application before it started. Adding a sleep command before the healthcheck allows enough time for
# the application to start before the healthcheck is executed.
HEALTHCHECK --interval=5s CMD sleep 10 && curl -f http://localhost:80/ || exit 1

# Delaying the execution of the Python script to allow time for the application to start
CMD python bot.py
