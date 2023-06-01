FROM ubuntu:23.10

RUN apt-get update && \
  apt-get install -y git bash python3-full python3-pip \
  python3-numpy python3-pandas &&\
  update-alternatives --install /usr/bin/python python /usr/bin/python3 1 &&\
  pip install \
  --break-system-packages \
  setuptools==66 \
  transformers huggingface_hub packaging tqdm requests cython scikit-learn \
  torch

ADD os/ /

WORKDIR app

ADD ./version version

RUN git clone --depth=1 https://github.com/FlagAI-Open/FlagAI.git


# RUN cd FlagAI && python3 setup.py install
