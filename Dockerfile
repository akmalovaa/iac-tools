ARG PYTHON_VERSION=3.13.2
FROM python:$PYTHON_VERSION-slim

RUN apt update && apt install -y \
        sshpass \
        jq \
        rsync \
        git

RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir ansible requests

# COPY requirements.yml .
# RUN ansible-galaxy install -r requirements.yml
RUN ansible-galaxy collection install community.docker

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/archives/* /var/cache/apt/lists/* /tmp/* /root/cache/.

WORKDIR /srv
