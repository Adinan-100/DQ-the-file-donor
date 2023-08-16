
# The original Dockerfile is missing the instruction to expose a port

FROM python:3.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

# Removed this line because it does not serve any purpose
# RUN /

RUN pip3 install -U cd pip && pip3 install -U -r requirements.txt
RUN mkdir /DQ-The-File-Donor
WORKDIR /DQ-The-File-Donor

COPY . .

# Expose port 80 for TCP trafficEX
POSE 80

CMD ["python", "bot.py"]

