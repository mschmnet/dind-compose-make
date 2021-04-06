FROM docker:dind

RUN apk add --update --no-cache py-pip python3-dev libffi-dev openssl-dev gcc libc-dev rust cargo make && \
    pip install docker-compose

ENTRYPOINT ["/usr/bin/make"]
