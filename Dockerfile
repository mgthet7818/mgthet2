FROM alpine:latest

RUN apk add --no-cache wget unzip

ARG CONFIG_FILE

WORKDIR /app

RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && \
    rm v2ray-linux-64.zip

COPY ${CONFIG_FILE} /app/config.json

EXPOSE 8080

ENTRYPOINT ["./v2ray", "run"]
