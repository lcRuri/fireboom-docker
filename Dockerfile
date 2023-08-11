FROM golang:1.20-alpine

MAINTAINER lcRuri

RUN apk update && \
    apk add --no-cache git bash curl

# 安装 Node.js
RUN apk add --no-cache nodejs npm

WORKDIR /dist

# 将代码复制到容器中

COPY ./host.sh /dist


#RUN chmod +x update-fb.sh
RUN chmod +x host.sh

# 指定挂载目录
VOLUME /dist/log
VOLUME /dist/store
VOLUME /dist/template
VOLUME /dist/upload
VOLUME /dist/custom-go
VOLUME /dist/custom-ts
VOLUME /dist/exported

EXPOSE 9991

ENTRYPOINT ["/dist/host.sh"]
