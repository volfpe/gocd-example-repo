FROM nvcr.io/nvidia/l4t-tensorflow:r32.5.0-tf2.3-py3

ARG MLFLOW_TRACKING_USERNAME
ARG MLFLOW_TRACKING_PASSWORD
ARG MLFLOW_S3_ENDPOINT_URL
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV FLASK_APP=server.py


WORKDIR /server

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

ARG MODEL_VERSION
RUN python3 getmodel.py

CMD flask run --host=0.0.0.0 --port=3000