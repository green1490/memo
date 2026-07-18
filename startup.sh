#!/bin/bash

logger "Installing podman"

sudo zypper in -y podman

logger "Finished installation"

if [ $? -eq 0 ]; then
    logger "Pulling image"
    podman run --name memos -p 5230:8080 docker.io/neosmemo/memos:0.29
    logger "Pulled image"

    if [ $? -eq 0 ]; then
        logger "Could not pull/run the image"
    fi
else
    logger "Could not install podman"
fi

logger "Finished startup script"
