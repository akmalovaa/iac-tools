# iac-tools

Ansible Docker image for homelab CI/CD

[![Docker](https://github.com/akmalovaa/iac-tools/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/akmalovaa/iac-tools/actions/workflows/docker-publish.yml)
![Base Image](https://img.shields.io/badge/base-python:3.14--slim-blue)

## Features

Базовый образ: [`python:3.14-slim`](https://hub.docker.com/_/python/tags)

### Системные пакеты

- `jq` - обработка JSON
- `yq` - обработка YAML/XML  
- `rsync` - синхронизация файлов
- `sshpass` - автоматизация SSH подключений
- `git` - система контроля версий
- `openssh-client` - SSH клиент

### Python пакеты

- `ansible-core` - минимальная установка Ansible без лишних коллекций
- `requests` - HTTP библиотека

### Ansible коллекции

- `community.docker` - управление Docker контейнерами  
- `ansible.posix` - POSIX утилиты

## Usage

### Скачать образ с [GHCR](https://ghcr.io/akmalovaa/iac-tools)

```bash
docker pull ghcr.io/akmalovaa/iac-tools
```

### Локальная сборка

```bash
just build

# Или напрямую через docker
docker build -t iac-tools .
```

### Запуск контейнера

```bash
# Интерактивный режим
docker run --rm -it ghcr.io/akmalovaa/iac-tools bash

# Монтирование текущей директории
docker run --rm -it -v "$(pwd)":/ansible ghcr.io/akmalovaa/iac-tools bash
```

### Примеры использования в CI/CD

#### GitHub Actions

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/akmalovaa/iac-tools:latest
    steps:
      - uses: actions/checkout@v4
      - run: ansible-playbook -i inventory playbook.yml
```

#### GitLab CI

```yaml
deploy:
  stage: deploy
  image: ghcr.io/akmalovaa/iac-tools
  script:
    - ansible-playbook -i inventory playbook.yml
  when: manual
```

## Development

Требования: [Docker](https://docs.docker.com/get-docker/), [just](https://github.com/casey/just) (опционально)

```bash
just build    # Собрать образ
just bash     # Запустить контейнер
just size     # Показать размер образа
just help     # Список команд
```
