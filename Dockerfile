## Buildstage ##
FROM ghcr.io/linuxserver/baseimage-alpine:3.18 as buildstage

WORKDIR /unrar
RUN apk add build-base wget && \
    wget 'https://github.com/pmachapman/unrar/archive/refs/heads/master.zip' && \
    unzip master.zip

WORKDIR /unrar/unrar-master
RUN make && make install

FROM scratch

COPY --from=buildstage /usr/bin/unrar /usr/bin/unrar
