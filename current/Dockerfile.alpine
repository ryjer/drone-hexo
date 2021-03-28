FROM node:current-alpine3.13

WORKDIR /hexo
VOLUME ["/hexo"]

EXPOSE 4000 

RUN npm install -g hexo-cli \
    && npm cache clean -f

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/ash"]
