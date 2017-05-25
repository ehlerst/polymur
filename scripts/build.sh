#!/bin/bash

DIR=`pwd -P`

GITVERSION=`git describe --always`
mkdir -p ${DIR}/build
rm -rf build/*

### Disable cgo
export CGO_ENABLED=0


pushd $GOPATH/src/github.com/jamiealquiza/polymur/cmd
go get ./...
popd

pushd $GOPATH/src/github.com/jamiealquiza/polymur/cmd/polymur-proxy
go build -ldflags "-X main.GitHash=${GITVERSION}" -o ${DIR}/build/polymur-proxy
popd
pushd $GOPATH/src/github.com/jamiealquiza/polymur/cmd/polymur-gateway
go build -ldflags "-X main.GitHash=${GITVERSION}" -o ${DIR}/build/polymur-gateway
popd
pushd $GOPATH/src/github.com/jamiealquiza/polymur/cmd/utils/pgw-key
go build -ldflags "-X main.GitHash=${GITVERSION}" -o ${DIR}/build/pgw-key
popd
pushd $GOPATH/src/github.com/jamiealquiza/polymur/cmd/polymur
go build -ldflags "-X main.GitHash=${GITVERSION}" -o ${DIR}/build/polymur
popd

