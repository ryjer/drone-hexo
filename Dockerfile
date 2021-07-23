FROM node:alpine

WORKDIR /hexo
VOLUME ["/hexo"]

EXPOSE 4000 

RUN npm install -g hexo-cli \
    && npm cache clean -f \
    && apk add --no-cache git openssh

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "/bin/ash" ]
