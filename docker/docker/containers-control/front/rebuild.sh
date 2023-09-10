#!/bin/bash

front_server_docker_dir="/home/nerovnia/docker/frontend"

cd "$front_server_docker_dir"

if docker ps | grep -q "front_server"; then
    docker stop front_server
    if [ $? -eq 0 ]; then
      docker rm front_server
    fi
fi
if [ $? -eq 0 ]; then
    docker build -t front_server . && \
        docker run --restart always -d --name front_server --network name_network --ip ip -p port front_server
fi
    
