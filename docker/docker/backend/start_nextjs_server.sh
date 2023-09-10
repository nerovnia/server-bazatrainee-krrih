#!/bin/sh
docker stop nextjs_server && \
	docker rm nextjs_server && \
	docker rmi nextjs_server && \
	docker build -t nextjs_server . && \
	docker run -d --name frontjs_server --network name_network --ip ip_address -p port nextjs_server&& \
	docker ps
