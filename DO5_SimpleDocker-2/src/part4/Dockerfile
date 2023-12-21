# Используем базовый образ
FROM nginx:latest
USER root
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./server.c /
COPY ./run.sh /
RUN apt-get update; \
    apt-get upgrade; \
    apt-get install -y spawn-fcgi libfcgi-dev gcc; \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["sh", "./run.sh"]
