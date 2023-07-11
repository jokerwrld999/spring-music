FROM alpine:3.14 as base

RUN  apk update \
    && apk upgrade \
    && apk add ca-certificates \
    && update-ca-certificates \
    && echo http://dl-cdn.alpinelinux.org/alpine/v3.6/main >> /etc/apk/repositories \
    && echo http://dl-cdn.alpinelinux.org/alpine/v3.6/community >> /etc/apk/repositories \
    && apk add --update coreutils && rm -rf /var/cache/apk/*   \ 
    && apk add --update openjdk11 mongodb mongodb-tools tzdata curl unzip bash openrc \
    && apk add --no-cache nss \
    && rm -rf /var/cache/apk/*

RUN openrc \
    && touch /run/openrc/softlevel \
    && mkdir -p /data/db/ \
    && chown -R root /data/db

FROM base as build
WORKDIR /opt/app
ADD . .
RUN ./gradlew clean assemble

FROM base
WORKDIR /opt/app

ADD ./custom-configs/deployment/start_mongo.sh ./

COPY --from=build /opt/app/build/libs/ ./
RUN chmod +x ./start_mongo.sh

ENTRYPOINT ["/opt/app/start_mongo.sh"]
EXPOSE 8080