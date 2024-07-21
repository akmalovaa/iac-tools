# Docker image for ci/cd
## Infrastructure as Code

В основном для развертывания инсфраструктуры использую:
- terraform
- ansible

Для **terraform** использую официальный образ `hashicorp/terraform:1.9`

Для **ansible** решил собрать свой набор необходимых инструментов:
- jq
- rsync
- requests
- sshpass

ansible-galaxy:
- community.docker


Возможно еще добавлю `yq` и пару инструментов для дебага или не тащить ничего лишнего и пойти в сторону alpine для уменьшения размера образа

## Usage

local pull
```bash
docker pull ghcr.io/akmalovaa/iac-tools
```

example `gitlab-ci.yml`
```yaml
deploy:
  stage: deploy
  image: ghcr.io/akmalovaa/iac-tools
  script:
    - cat /etc/os-release
  when: manual
```



