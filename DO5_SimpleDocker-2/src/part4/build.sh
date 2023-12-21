#!/bin/bash

docker rm -f server
docker build . -t server:latest -f Dockerfile
docker run -d -p 80:81 -v "$(pwd)/../nginx/nginx.conf:/etc/nginx/nginx.conf" --name server server:latest

sleep 5

printf "\e[0m\e[3;40;95m%s\e[0m\n" "Проверяем, что по localhost:80 доступна страничка написанного мини сервера"
curl localhost:80
printf "\n"
printf "\e[0m\e[3;40;95m%s\e[0m\n" "Проверим, что теперь по localhost:80/status отдается страничка со статусом nginx"
curl localhost:80/status