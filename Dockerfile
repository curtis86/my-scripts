FROM alpine:3.14
MAINTAINER Curtis K <curtis@linux.com>

# Install script dependencies
RUN apk add --no-cache openssl curl bind-tools less bash

# Add our scripts to /opt
WORKDIR /opt
ADD . /opt/my-scripts
