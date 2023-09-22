FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add python3 python3-dev py3-pip build-base zlib-dev 
COPY install.sh /
RUN sh +x /install.sh
