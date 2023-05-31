#!/bin/bash

VERSION=2.6

echo "Build checkbox ${VERSION} for Ubuntu Focal"
# FIXME : UBUNTU_RELEASE argument is not working
docker build -t checkbox:${VERSION} --build-arg CHECKBOX_VERSION=${VERSION} ./
