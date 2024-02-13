FROM ubuntu:23.10
LABEL maintainer="pmatos@igalia.com"
LABEL description="An image to setup the environment to build FEX and run its CI using nektos/act"

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update && \
    apt upgrade -y && \
    apt install -y cmake clang-16 llvm-16 nasm ninja-build pkg-config libcap-dev libglfw3-dev libepoxy-dev python3-dev libsdl2-dev \
    python3 linux-headers-generic git

WORKDIR /root
