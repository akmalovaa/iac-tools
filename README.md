# Docker image for ci/cd

![Base Image](https://img.shields.io/badge/base-python:3.14--slim-blue)
![Docker Image Size](https://img.shields.io/badge/size-366MB-green)

## Infrastructure as Code

Для развертывания инфраструктуры homelab использую:

- **terraform** - [официальный образ](https://hub.docker.com/r/hashicorp/terraform/tags)
- **ansible** - свой образ с набором инструментов на базе [python](https://hub.docker.com/_/python/tags)

## Ansible Image Features

Базовый образ: `python:3.14-slim`

### Установленные инструменты

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

## Usage

### Скачать образ с github container registry

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
docker run --rm -it -v $(pwd):/ansible ghcr.io/akmalovaa/iac-tools bash
```

### Примеры использования в CI/CD

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

Для разработки используется [just](https://github.com/casey/just) для автоматизации команд:

```bash
just build    # Собрать образ
just bash     # Запустить контейнер
just size     # Показать размер образа
just help     # Список команд
```
