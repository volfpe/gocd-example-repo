FROM python:3.9.2-alpine3.12

WORKDIR /server

COPY . .
ENV FLASK_APP=server.py
RUN source venv/bin/activate
RUN pip install -r requirements.txt

CMD flask run --host=0.0.0.0 --port=3000