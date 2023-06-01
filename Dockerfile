FROM ubuntu:23.10

WORKDIR app

ADD ./version.txt version

RUN \
sed -i s/ports.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list &&\
sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list &&\
sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list &&\
apt-get update && \
apt-get install -y git pkg-config bash \
python3-full python3-pip python3-aiohttp &&\
update-alternatives --install /usr/bin/python python /usr/bin/python3 1 &&\
pip install -i https://mirrors.aliyun.com/pypi/simple/ \
--break-system-packages \
setuptools==66 \
urllib3==1.26.16 \
scipy transformers huggingface_hub packaging tqdm requests cython \
torch onnx && apt-get clean -y

# RUN git clone --depth=1 https://github.com/FlagAI-Open/FlagAI.git
RUN git clone --depth=1 https://github.com/xxaier/FlagAI.git

ADD os/ /
ENV PYTHONPATH=/app
RUN cd FlagAI && python setup.py install
