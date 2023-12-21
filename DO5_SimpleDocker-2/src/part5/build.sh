#!/bin/bash

docker rm -f server5
docker build . -t server5:1.1 -f Dockerfile
docker run -d -p 80:81 -v "$(pwd)/../nginx/nginx.conf:/etc/nginx/nginx.conf" --name server5 server5:1.1

sleep 1

printf "\e[0m\e[3;40;95m%s\e[0m\n" "Проверяем, что по localhost:80 доступна страничка написанного мини сервера"
curl localhost:80
printf "\n"
printf "\e[0m\e[3;40;95m%s\e[0m\n" "Проверим, что теперь по localhost:80/status отдается страничка со статусом nginx"
curl localhost:80/status

export DOCKER_CONTENT_TRUST=1
dockle --ignore CIS-DI-0010 -ak NGINX_GPKEY server5:1.1