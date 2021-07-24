FROM node:alpine

WORKDIR /hexo
VOLUME ["/hexo"]

EXPOSE 4000

# 安装 hexo 并清理 npm 缓存
RUN npm install -g hexo-cli \
    && npm cache clean -f

# 安装必要软件包，支持 git ssh-keyscan 命令的运行
RUN apk add --no-cache git openssh git-lfs ca-certificates && \
    rm -rf /var/cache/apk/*

# 创建相关目录和配置文件
RUN mkdir -p ~/.ssh && \
    chmod 0700 ~/.ssh && \
    touch ~/.ssh/id_rsa      && chmod 600 ~/.ssh/id_rsa && \
    touch ~/.ssh/id_rsa.pub  && chmod 644 ~/.ssh/id_rsa.pub && \
    touch ~/.ssh/known_hosts && chmod 644 ~/.ssh/known_hosts

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "/bin/ash" ]
