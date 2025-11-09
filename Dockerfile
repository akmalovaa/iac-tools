ARG PYTHON_VERSION=3.14
FROM python:$PYTHON_VERSION-slim

RUN apt update && apt install -y --no-install-recommends \
        sshpass \
        jq \
        yq \
        rsync \
        git \
        openssh-client \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/* /var/tmp/*

# ansible-core + requests
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir ansible-core requests \
    && pip cache purge

# install ansible collections from requirements.yml
COPY requirements.yml .
RUN ansible-galaxy collection install -r requirements.yml \
    && rm -rf ~/.ansible/tmp/* ~/.cache/ansible-galaxy /tmp/* /var/tmp/* /root/.ansible/galaxy_cache

WORKDIR /ansible
