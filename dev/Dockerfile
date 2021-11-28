ARG BASE_REGISTRY=ghcr.io
ARG BASE_IMAGE=linuxserver/code-server
ARG BASE_TAG=version-v3.11.0
FROM $BASE_REGISTRY/$BASE_IMAGE:$BASE_TAG

ARG GO_VER=1.17.3
ENV PATH "$PATH:/usr/local/go/bin"

COPY go${GO_VER}.linux-amd64.tar.gz /tmp
RUN tar -C /usr/local -xzf /tmp/go${GO_VER}.linux-amd64.tar.gz

RUN apt clean && rm -rf /var/lib/apt/lists/* && apt clean && apt update -y && apt upgrade -y &&\
    apt install nodejs 