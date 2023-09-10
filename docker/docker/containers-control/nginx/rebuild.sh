#!/bin/bash

if docker ps | grep -q "nginx_proxy"; then
    docker stop nginx_proxy
    if [ $? -eq 0 ]; then
        if docker ps -a | grep -q "nginx_proxy"; then
            docker rm nginx_proxy
        fi
    fi
fi

if [ $? -eq 0 ]; then
docker run --restart always -d -e NGINX_ENTRYPOINT_QUIET_LOGS=1 --name nginx_proxy --network name_network --ip ip_address \
      -v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
      -v /etc/nginx/mime.types:/etc/nginx/mime.types \
      -v /etc/nginx/html/fallback.html:/etc/nginx/html/fallback.html \
      -v /root/certs/:/root/ssl/ \
      -v container_logs:/var/log/nginx_proxy \
      -p 80:80 -p 443:443 nginx:latest
fi
