FROM mhart/alpine-node:8
LABEL maintainer="Leonardo Flores <contato@leonardocouy.com>"

# Install required dependencies
RUN apk add --no-cache --update \
  build-base \
  git \
  python2

# Libsass & Sassc install (required for node-sass)
RUN \
  mkdir -p /tmp \
  && cd /tmp \
  && git clone https://github.com/sass/sassc \
  && cd sassc \
  && git clone https://github.com/sass/libsass \
  && SASS_LIBSASS_PATH=/tmp/sassc/libsass make -j4 \
  && mv /tmp/sassc/bin/sassc /usr/bin/sass

# Cleanup and remove build dependency
RUN \
  apk del build-base git \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp
