FROM ubuntu:23.10
LABEL maintainer="pmatos@igalia.com"
LABEL description="An image to setup the environment to build FEX and run its CI using nektos/act"

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update && \
    apt upgrade -y && \
    apt install -y cmake clang llvm lld nasm ninja-build pkg-config libcap-dev libglfw3-dev libepoxy-dev python3-dev libsdl2-dev \
    python3 linux-headers-generic git python3-xxhash nodejs squashfs-tools curl

# Copy local file to the container
RUN mkdir -p /mnt/AutoNFS/rootfs
COPY RootFS_links.txt /mnt/AutoNFS/rootfs/

# Copy squash file
RUN mkdir /mnt/AutoNFS/rootfs/2023-12-03
COPY Ubuntu_23_10.sqsh /mnt/AutoNFS/rootfs/2023-12-03/

WORKDIR /root
