# Docker image for iac pipelines

docker image for ci/cd

```bash
docker pull ghcr.io/akmalovaa/iac-tools
```

exmaple gitlab-ci.yml
```yaml
deploy:
  stage: deploy
  image: ghcr.io/akmalovaa/iac-tools
  script:
    - cat /etc/os-release
  when: manual
```

## Terraform

## Ansible
- community.docker
- proxmoxer
- sshpass

## Task

