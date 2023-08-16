FROM python:3.8-slim-buster

RUN apt update && apt upgrade -y

RUN apt install git -y

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

RUN mkdir /DQ-The-File-Donor

WORKDIR /DQ-The-File-Donor

COPY . .

EXPOSE 80

 applicationHEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:80/ || exit 1

CMD ["python", "bot.py"]

