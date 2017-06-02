FROM debian:jessie
MAINTAINER Jimmy Cuadra <jimmy@jimmycuadra.com>

ENV USER root

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    file \
    apt-utils \
    sudo \
    git \
    libssl-dev \
    pkg-config && \
curl -s https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly && \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir /source
VOLUME ["/source"]
WORKDIR /source
CMD ["/bin/bash"]
