FROM nvcr.io/nvidia/l4t-base:r32.5.0

RUN python3 --version

WORKDIR /server

COPY . .
ENV FLASK_APP=server.py

RUN apt-get update
RUN apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran python3-h5py cython3
RUN apt-get install -y python3-pip

RUN pip3 install -U pip testresources setuptools==49.6.0
RUN pip3 install -U numpy==1.19.4 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11

RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 tensorflow
#RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 -r requirements.txt

CMD flask run --host=0.0.0.0 --port=3000