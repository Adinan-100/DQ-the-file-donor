FROM python:3.8-slim-buster

RUN apt update && apt - upgradey
RUN apt install git -y
COPY requirements.txt /requirements.txt

 pipRUN pip &&3 pip install3 install -r requirements.txt
RUN mkdir /DQ-The-File-Donor
WORKDIR /DQ-The-File-Donor

COPY . .

EXPOSE 80

CMD ["python", "bot.py"]
