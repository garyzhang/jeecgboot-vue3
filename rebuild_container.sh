#!/bin/sh
docker stop jeecgboot-vue3-nginx
docker rm jeecgboot-vue3-nginx
docker rmi jeecgboot-vue3

yarn run build
docker build -t jeecgboot-vue3 .

docker run --name jeecgboot-vue3-nginx -p 8084:80 -d jeecgboot-vue3
