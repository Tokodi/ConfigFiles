#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./docker.sh <container_name>"
    exit 0
fi

IMAGE_NAME=$1
HOSTNAME="dockerhost"

docker run                  \
    --hostname ${HOSTNAME}  \
    -ti                     \
    ${IMAGE_NAME}           \
    bash
