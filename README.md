# About
Alpine Linux root file system builder for luckfox SBC

# Requirements
I tested on my Ubuntu 22.04.4 LTS
* Ubuntu 22.04.4 LTS
* Docker

# Usage
1. Run `build-docker.sh` to build base Alpine Linux image by docker
2. Run `build-rootfs.sh` to build Alpine Linux rootfs
3. Use `alpine.tar.gz` as root file system in your luckfox SBC

# Customization
## Install packages by `*.packages`
You can add package installation scripts in `*.packages` directory.

package installation scripts are executed brefore building rootfs structure.

__SCRIPTS IN `*.packages` MUST BE EXECUTABLE__

## Add files or directories by `*.overlay`
You can create built-in file system structure or add files in `*.overlay` directory.

overlay file system is applied before archiving rootfs.

# Build SDK with custom rootfs
luckfox provides a method to build SDK with custom rootfs.

https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-Alpine-Linux-2#9-package-the-rootfs-and-integrate-it-into-the-sdk-for-image-building