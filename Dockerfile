FROM python:3.8-slim-buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install git -y

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

RUN mkdir /DQ_The_File_Donor

WORKDIR /DQ_The_File_Donor

COPY . .

EXPOSE 80#

RUN apt-get install curl -y

CMD sleep 10 && python bot.py
