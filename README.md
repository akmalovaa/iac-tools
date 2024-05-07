# Docker image for iac pipelines

Container image for ci/cd

- **Ansible:** 2.16.6
- **Terraform:** 1.8.2
- **Task:** 3.36.0
- curl
- git
- proxmoxer
- requests
- sshpass


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



