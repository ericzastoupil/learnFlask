# syntax=docker/dockerfile:1
FROM ubuntu

RUN apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:deadsnakes/ppa && \
	apt-get update && \
	apt-get install -y \
	python3.8 \
	python3-pip

WORKDIR /learnFlask
COPY . /learnFlask

ENV FLASK_APP=microblog.py

#add these to requirements.txt 
#once I know what I really need
RUN pip install \
	flask \
	flask_sqlalchemy \
	flask-wtf \
	flask_migrate \
	flask-login

#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt

#RUN flask db init