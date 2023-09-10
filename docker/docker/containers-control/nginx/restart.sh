#!/bin/bash

if docker ps | grep -q "nginx_proxy"; then
  docker restart nginx_proxy
else
  if docker ps -a | grep -q "nginx_proxy"; then
    docker start nginx_proxy
  fi
fi
