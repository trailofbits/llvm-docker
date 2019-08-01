FROM alpine:latest
MAINTAINER Evan Sultanik <evan.sultanik@trailofbits.com>

ARG LLVM_VERSION=7.0.0

# LLVM dependencies:
RUN apk --no-cache add \
	autoconf \
	automake \
	cmake \
	freetype-dev \
	g++ \
	gcc \
	libxml2-dev \
	linux-headers \
	make \
	musl-dev \
	ncurses-dev \
	python2

COPY install_llvm.sh /
RUN ./install_llvm.sh ${LLVM_VERSION} && rm install_llvm.sh

ENV CXX=clang++
ENV CC=clang
