FROM nvcr.io/nvidia/l4t-base:r32.5.0

WORKDIR /server

COPY . .
ENV FLASK_APP=server.py

RUN sudo apt-get update
RUN sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
RUN sudo apt-get install python3-pip
RUN sudo pip3 install -U pip testresources setuptools==49.6.0

RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 tensorflow
#RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 -r requirements.txt

CMD flask run --host=0.0.0.0 --port=3000