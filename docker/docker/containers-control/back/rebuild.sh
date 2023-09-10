#!/bin/bash

back_server_docker_dir=""

cd "$back_server_docker_dir"

if docker ps | grep -q "back_server"; then
    docker stop back_server
    if [ $? -eq 0 ]; then
      docker rm back_server
    fi
fi
if [ $? -eq 0 ]; then
    docker build -t back_server .
fi
if [ $? -eq 0 ]; then
    docker run --restart always -d --name back_server --network name_network --ip ip -p port \
        -v host_dir:container_dir  \
        back_server
fi

cd -

