FROM thingswise/dcd-docker
MAINTAINER Alexander Lukichev

RUN opkg-install bash git nano bind-dig openssh-client-utils wget ca-certificates

ENV FLEET_VERSION 0.11.5
ENV ETCDCTL_VERSION 2.1.2

RUN \
  wget -P /tmp https://github.com/coreos/fleet/releases/download/v${FLEET_VERSION}/fleet-v${FLEET_VERSION}-linux-amd64.tar.gz && \
  gunzip /tmp/fleet-v${FLEET_VERSION}-linux-amd64.tar.gz && \
  tar -xf /tmp/fleet-v${FLEET_VERSION}-linux-amd64.tar -C /tmp && \
  mv /tmp/fleet-v${FLEET_VERSION}-linux-amd64/fleetctl /bin/ && \
  rm -rf /tmp/fleet-v${FLEET_VERSION}-linux-amd64*

RUN \
  wget -P /tmp https://github.com/coreos/etcd/releases/download/v${ETCDCTL_VERSION}/etcd-v${ETCDCTL_VERSION}-linux-amd64.tar.gz  && \
  gunzip /tmp/etcd-v${ETCDCTL_VERSION}-linux-amd64.tar.gz && \
  tar -xf /tmp/etcd-v${ETCDCTL_VERSION}-linux-amd64.tar -C /tmp && \
  mv /tmp/etcd-v${ETCDCTL_VERSION}-linux-amd64/etcdctl /bin/ && \
  rm -rf /tmp/etcd-v${ETCDCTL_VERSION}-linux-amd64*

CMD ["/dcd"]
