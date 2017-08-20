# Running

From armv7 device

## Minimal commands

`docker pull kylejw/etcd-arm`
`docker run -it -p 2379:2379 kylejw/etcd-arm /etcd`
`docker run -it -p 2379:2379 kylejw/etcd-arm /etcdctl`


## etcd Discovery Service

This image contains only the etcd and etcdctl binaries.  In order to use the etcd Discovery Service you must provide trust certificates for https://discovery.etcd.io  
The simplest way is to mount the trusted CAs from your host device: (suggested to mount in read-only mode)  

Eg:

`docker run --name etcd \`
`  -p 2379:2379 -p 2380:2380 -p 4001:4001 -p 7001:7001 \`
`  -v /etc/ssl/certs/ca-certificates.crt:/etc/ssl/certs/ca-certificates.crt:ro \`
`  kylejw/etcd-arm /etcd -name=etcd -discovery=https://discovery.etcd.io/....`

# Building

From any device

_Note: This dockerfile uses a multi-stage build which requires Docker version 17.06 or later_
docker build -t etcd-arm . 


