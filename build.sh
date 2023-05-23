#!/bin/bash

RELEASE=${UBUNTU_RELEASE:-jammy}
VERSION=2.6

echo "Build checkbox ${VERSION} for Ubuntu ${RELEASE}"
# FIXME : UBUNTU_RELEASE argument is not working
docker build -t checkbox:${VERSION} --build-arg UBUNTU_RELEASE=${RELEASE} --build-arg CHECKBOX_VERSION=${VERSION} ./
