FROM python:3.8-slim-buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install git -y

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

RUN mkdir /DQ_The_File_Donor

WORKDIR /DQ_The_File_Donor

COPY . .

EXPOSE 80

RUN apt-get install -y curl

CMD sleep 15 && python bot.py

HEALTHCHECK --interval=5s CMD curl -f http://localhost:80/ || exit 1
