FROM nvcr.io/nvidia/l4t-tensorflow:r32.5.0-tf2.3-py3

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


WORKDIR /server

COPY . .
ENV FLASK_APP=server.py

RUN pip3 install -r requirements.txt

CMD flask run --host=0.0.0.0 --port=3000