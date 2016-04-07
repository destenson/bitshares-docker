FROM base/archlinux
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Update package database
RUN pacman -Sy

## Install keyring for verification of sources
RUN pacman --noconfirm -Sy archlinux-keyring
RUN pacman-key --init
RUN pacman-key --populate archlinux

## Upgrade Archlinux
RUN pacman --noconfirm -Syu
RUN pacman-db-upgrade

## Install build dependencies
RUN pacman --noconfirm -S base-devel git openssh
RUN pacman --noconfirm -S boost boost-libs 
RUN pacman --noconfirm -S cmake wget curl python

## Fetching BitShares-2
WORKDIR /
RUN git clone https://github.com/bitshares/bitshares-2 /bitshares-2-git
WORKDIR /bitshares-2-git
RUN git submodule update --init --recursive

## Building BitShares-2
RUN mkdir /build
WORKDIR /build
RUN cmake -DCMAKE_BUILD_TYPE=Release /bitshares-2-git
RUN make || make -j 1

RUN mkdir /bitshares-2
RUN cp -r /build/programs /bitshares-2/

## Cleanup to reduce container size
RUN rm -rf /bitshares-2-git \
           /build
