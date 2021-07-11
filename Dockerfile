FROM docker:dind

RUN apk add --update --no-cache py-pip python3-dev libffi-dev openssl-dev gcc libc-dev rust cargo make && \
    pip install docker-compose

RUN apk --no-cache add curl && \
    base=https://github.com/docker/machine/releases/download/v0.16.0 && \
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && \
    mv /tmp/docker-machine /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

WORKDIR /opt/app

ENTRYPOINT ["/usr/bin/make"]
