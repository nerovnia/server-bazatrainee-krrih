#!/bin/bash

if docker ps | grep -q "mongo"; then
    docker stop mongo
    if [ $? -eq 0 ]; then
        if docker ps -a | grep -q "mongo"; then
            docker rm mongo
        fi
    fi
fi

if [ $? -eq 0 ]; then
  docker run --restart always -d --network name_network --ip ip_address -p 27017:27017 --name mongo \
    -e MONGO_INITDB_ROOT_USERNAME=login \
    -e MONGO_INITDB_ROOT_PASSWORD=password \
    -e MONGODB_INITDB_DATABASE=db_name \
    -v volume_name:/data/db \
    mongo:version
fi
