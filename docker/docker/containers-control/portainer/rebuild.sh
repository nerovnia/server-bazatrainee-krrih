#!/bin/bash

if docker ps | grep -q "portainer"; then
    docker stop portainer
    if [ $? -eq 0 ]; then
        if docker ps -a | grep -q "portainer"; then
            docker rm portainer
        fi
    fi
fi

if [ $? -eq 0 ]; then
    docker run --restart always -d  --name portainer --network name_network --ip ip_address -p 9000:9000 -p 8000:8000 \
        -v container_logs:/var/log/portainer \
        -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
fi
