#!/bin/bash

DIR=`pwd -P`

GITVERSION=`git describe --always`
ARCH=`uname -m`
DESCRIPTION="polymur is a service that accepts Graphite plaintext protocol metrics and ships them over https"

### Amazon
BUILDROOT=${DIR}/build

BUILD=${BUILDROOT}/sysv
mkdir -p ${BUILD}/usr/local/bin
cp -r scripts/config/sysv/* ${BUILD}/.
cp ${BUILDROOT}/* ${BUILD}/usr/local/bin/.

PACKAGE_NAME="${BUILD}/polymur-${GITVERSION}.amzn.${ARCH}.rpm"

pushd ${BUILD}
fpm -n polymur -s dir -t rpm -v ${GITVERSION} --description "${DESCRIPTION}" --conflicts polymur --replaces polymur --provides polymur -C ${BUILD} -p ${PACKAGE_NAME} --license "MIT" .
popd
