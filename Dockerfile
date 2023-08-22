FROM python:3.10.8-slim-buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y git

COPY requirements.txt /requirements.txt

RUN pip install -U pip && pip install -r requirements.txt

RUN mkdir /TheFileDonor
WORKDIR /TheFileDonor

COPY start.sh /start.sh

CMD ["/bin/bash", "/start.sh"]
