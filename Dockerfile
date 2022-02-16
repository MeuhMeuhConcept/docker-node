FROM node:lts-alpine3.12

MAINTAINER jn.germon@meuhmeuhconcept.com

RUN apk update && \
    apk add \
        yarn \
        bash \
        zsh \
        git \
        python3 \
        make \
        gcc \
        g++ \
        linux-headers \
        udev \
        openssh \
    && rm -rf /var/cache/apk/*

RUN deluser --remove-home node

VOLUME /home/developer

COPY entrypoint.sh /

RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
