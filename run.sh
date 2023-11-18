#!/usr/bin/env bash

if [ ! "$(command -v docker)" ] || [ ! -e ~/.docker/cli-plugins/docker-compose ]; then
  echo '"docker compose" command not found. Please install docker environments.'
  exit 1;
fi

docker-compose up -d dev
docker-compose exec dev /bin/bash