#!/bin/sh

TAG=$1
if [ -z "$TAG" ]; then
	TAG=latest
fi

dd if=/dev/zero of=rootfs.ext4 bs=1M count=128
mkfs.ext4 rootfs.ext4

mkdir -p $PWD/my-rootfs
sudo mount rootfs.ext4 $PWD/my-rootfs

docker run --rm --privileged multiarch/qemu-user-static --reset --persistent yes
docker run -it --entrypoint /mnt/host/pack-rootfs.sh -v $PWD/my-rootfs:/my-rootfs -v $PWD:/mnt/host --name luckfox-pico-alpine-env luckfox-pico-alpine:$TAG
docker rm luckfox-pico-alpine-env

sudo umount $PWD/my-rootfs
rm rootfs.ext4
rmdir my-rootfs