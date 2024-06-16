#!/bin/sh
TAG=$1
if [ -z "$TAG" ]; then
	TAG=latest
fi
docker run --rm --privileged multiarch/qemu-user-static --reset --persistent yes
docker build --tag luckfox-pico-alpine:$TAG .
