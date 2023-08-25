FROM golang:1.20-alpine

MAINTAINER lcRuri

RUN apk update && \
    apk add --no-cache git bash curl

# 安装 Node.js
RUN apk add --no-cache nodejs npm

WORKDIR /fbserver

# 将代码复制到容器中
COPY . .


#RUN chmod +x update-fb.sh
RUN chmod +x host.sh
RUN chmod +x update-fb.sh

# 指定挂载目录
VOLUME /fbserver/log
VOLUME /fbserver/store
VOLUME /fbserver/template
VOLUME /fbserver/upload
VOLUME /fbserver/custom-go
VOLUME /fbserver/custom-ts



EXPOSE 9123
EXPOSE 9991

ENTRYPOINT ["/fbserver/host.sh"]