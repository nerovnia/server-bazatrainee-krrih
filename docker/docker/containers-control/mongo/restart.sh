#!/bin/bash

if docker ps | grep -q "mongo"; then
  docker restart mongo
else
  if docker ps -a | grep -q "mongo"; then
    docker start mongo
  fi
fi
