FROM alpine:latest
MAINTAINER Philipp Hellmich <phil@hellmi.de>

RUN apk add --no-cache tini python3 python3-dev py-requests git curl libffi-dev build-base

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
VOLUME /config

# Grab source
# RUN git clone https://github.com/home-assistant/appdaemon.git . && pip3 install .

RUN pip3 install appdaemon

ENTRYPOINT ["/sbin/tini"]

CMD [ "appdaemon", "-c", "/config" ]
