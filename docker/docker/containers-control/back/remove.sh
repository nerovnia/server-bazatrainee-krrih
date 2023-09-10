#!/bin/bash

if [ $? -eq 0 ]; then
  docker stop back_server
fi
if [ $? -eq 0 ]; then
  docker rm back_server
fi
if [ $? -eq 0 ]; then
  docker rmi back_server
fi
