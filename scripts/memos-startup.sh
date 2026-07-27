#!/bin/bash

logger "Installing podman"
sudo zypper in -y podman || logger "Could not install podman"
logger "Finished installation"

logger "Formatting the persistant disk"
sudo mkfs.ext4 /dev/disk/by-id/google-persistent-disk-1
logger "Formated the persistant disk"

logger "Mounting the disk"
sudo mkdir /mnt/data
sudo mount /dev/disk/by-id/google-persistent-disk-1 /mnt/data || logger "Could not mount the disk"
logger "Finished mounting the disk"

mkdir /mnt/data/memos
sudo chmod o+w /mnt/data/memos

logger "Pulling image"
podman run --name memos -p 8080:5230 -v /mnt/data/memos:/var/opt/memos:Z docker.io/neosmemo/memos:0.29|| logger "Could not pull/run the image"
logger "Pulled image"

logger "Finished startup script"
