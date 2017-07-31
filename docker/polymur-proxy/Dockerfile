FROM golang:1.8.3-alpine 

MAINTAINER Tim Ehlers <ehlerst@gmail.com>

RUN apk add --no-cache git
RUN go get -u github.com/jamiealquiza/polymur/...
RUN go install github.com/jamiealquiza/polymur/cmd/polymur-proxy

CMD ["/go/bin/polymur-proxy"]
