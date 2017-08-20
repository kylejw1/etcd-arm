FROM golang:1.7 as builder
MAINTAINER kylejw1@gmail.com

ENV GOPATH=/go
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

WORKDIR /go/src/github.com/coreos

ARG ETCD_BRANCH=v3.0.15

RUN git clone --branch ${ETCD_BRANCH} https://github.com/coreos/etcd.git

RUN cd etcd && ./build

RUN cd etcd/bin/arm

#CMD /bin/bash -c "cp etcd /out && cp etcdctl /out"

FROM scratch

MAINTAINER kylejw1@gmail.com

COPY --from=builder /go/src/github.com/coreos/etcd/bin/arm/etcd .
COPY --from=builder /go/src/github.com/coreos/etcd/bin/arm/etcdctl .

ENV ETCD_UNSUPPORTED_ARCH=arm

CMD /etcd

