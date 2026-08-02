#!/bin/bash

sudo zypper in -y podman || logger "Failed to install podman"

podman run \
  --name beszel \
  --restart=unless-stopped \
  -e APP_URL=http://localhost:8090 \
  -p 8080:8090 \
  docker.io/henrygd/beszel|| logger "Could not run checkmk image"
