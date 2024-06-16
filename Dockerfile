FROM arm32v7/alpine

RUN apk update
RUN apk add --no-cache openrc agetty
RUN rc-update add devfs boot && \
    rc-update add procfs boot && \
    rc-update add sysfs boot && \
    rc-update add networking default && \
    rc-update add local default
