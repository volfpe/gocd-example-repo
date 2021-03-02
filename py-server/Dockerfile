FROM python:3.8-buster

WORKDIR /server

COPY . .
ENV FLASK_APP=server.py
RUN pip3 install -r requirements.txt

CMD flask run --host=0.0.0.0 --port=3000