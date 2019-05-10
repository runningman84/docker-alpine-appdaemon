FROM alpine:3.8
MAINTAINER Philipp Hellmich <phil@hellmi.de>

ARG UID=1000
ARG GUID=1000
ARG VERSION=3.0.4

RUN apk add --no-cache tini python3 python3-dev py-requests git curl libffi-dev build-base py3-cffi && \
    addgroup -g ${GUID} hass && \
    adduser -D -G hass -s /bin/sh -u ${UID} hass && \
    pip3 install --upgrade pip && \
    pip3 install appdaemon=="${VERSION}"

VOLUME /config

ENTRYPOINT ["/sbin/tini"]

CMD [ "appdaemon", "-c", "/config" ]
