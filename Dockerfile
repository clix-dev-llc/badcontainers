FROM ubuntu:18.04

RUN apt-get update && apt-get install curl -y && apt-get clean

ENV AMICONTAINED_SHA256 4e32545f68f25bcbcd4cce82743e916a054e1686df44fab68420fc9f94f80b21
RUN curl -fSL "https://github.com/genuinetools/amicontained/releases/download/v0.4.7/amicontained-linux-amd64" -o "/usr/local/bin/amicontained" \
    && echo "${AMICONTAINED_SHA256}  /usr/local/bin/amicontained" | sha256sum -c - \
    && chmod a+x "/usr/local/bin/amicontained"

CMD ["/usr/local/bin/amicontained"]
