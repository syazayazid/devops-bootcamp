#!/bin/bash
curl -fsSL https://get.docker.com | sh
id ssm-user &>/dev/null || useradd -m ssm-user
usermod -aG docker ssm-user
curl -fsSL https://raw.githubusercontent.com/RackulaLives/Rackula/main/deploy/docker-compose.persist.yml -o docker-compose.yml
mkdir -p data && chown 1001:1001 data
docker compose up -d
