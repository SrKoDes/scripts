FROM python:3.10
WORKDIR /home
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . /home
ENV FLASK_APP=application.py

ENTRYPOINT flask run --host=0.0.0.0
