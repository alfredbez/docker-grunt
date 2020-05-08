FROM alpine:latest

ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

RUN apk --update add autoconf automake libtool nasm build-base git nodejs python ruby ruby-dev nodejs-dev npm zlib-dev && \
  npm i npm@latest -g && \
  rm -rf /var/cache/apk/* && \
  npm install -g grunt-cli@1.2.0 && \
  gem install sass --no-document && \
  npm rebuild node-sass

WORKDIR /srv
VOLUME /srv

ENV LC_ALL=C.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
