#!/bin/sh
echo "Building rootfs structure..."
cd /
for d in bin etc lib root sbin usr; do tar c "$d" | tar x -C /my-rootfs; done
for dir in dev proc run sys var; do mkdir /my-rootfs/${dir}; done

echo "Installing custom packages..."
BUILDS_DIRECTORY="/mnt/host/packages"
cd "$BUILDS_DIRECTORY"
for file in *; do
    if [ -x "$file" ]; then
        ./"$file"
    fi
done

echo "Applying overlay..."
cp -rf /mnt/host/overlay/* /my-rootfs

echo "Archiving rootfs..."
cd /my-rootfs/ && rm -rf /mnt/host/alpine.tar.gz && tar czf /mnt/host/alpine.tar.gz *