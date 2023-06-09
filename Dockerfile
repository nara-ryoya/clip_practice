FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PIP_DEFAULT_TIMEOUT=100

RUN apt-get update && apt-get upgrade -y
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F39F6D246A59DDE01C866C425A78330DFF0A946E
RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install locales git vim python3.10 build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev libopencv-dev tk-dev git pip && \
    pip install poetry && \
    ln -s $(which python3) /usr/bin/python

WORKDIR /root/workdir/


COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false && \
    poetry install


CMD ["/bin/bash"]
