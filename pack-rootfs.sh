#!/bin/sh
echo "Installing packages..."
BASE_PACKAGE_DIRECTORY="/mnt/host/base.packages"
cd "$BASE_PACKAGE_DIRECTORY"
for file in *; do
    if [ -x "$file" ]; then
        ./"$file"
    fi
done

USER_PACKAGE_DIRECTORY="/mnt/host/user.packages"
cd "$USER_PACKAGE_DIRECTORY"
for file in *; do
    if [ -x "$file" ]; then
        ./"$file"
    fi
done

echo "Building rootfs structure..."
cd /
for d in bin etc lib root sbin usr; do tar c "$d" | tar x -C /my-rootfs; done
for dir in dev proc run sys var tmp; do mkdir /my-rootfs/${dir}; done

echo "Applying overlay..."
cp -rf /mnt/host/base.overlay/* /my-rootfs
cp -rf /mnt/host/user.overlay/* /my-rootfs

echo "Archiving rootfs..."
cd /my-rootfs/ && rm -rf /mnt/host/alpine.tar.gz && tar czf /mnt/host/alpine.tar.gz *