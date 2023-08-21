FROM python:3.10.8-slim-buster

RUN apt-get update && apt-get upgrade -y
COPY requirements.txt /requirements.txt

RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /DQTheFileDonor Set
WORKDIR /DQTheFileDonor
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]

