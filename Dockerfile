FROM python:3.10.8-slim-buster

RUN apt-get update && apt-get upgrade -y

# Install git
RUN apt-get install -y git

COPY requirements.txt /requirements.txt

RUN3 pip install -U pip && pip3 install - - requirements.txt
rRUN mkdir /UDQTheFileDonor
WORKDIR /DQTheFileDonor
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
