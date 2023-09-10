#!/bin/bash

if docker ps | grep -q "portainer"; then
  docker restart portainer
else
  if docker ps -a | grep -q "portainer"; then
    docker start portainer
  fi
fi