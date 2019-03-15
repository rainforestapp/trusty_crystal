FROM ubuntu:trusty as runtime

RUN \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y tzdata gcc pkg-config libssl-dev libssh2-1-dev libxml2-dev libyaml-dev libgmp-dev git make && \
  apt-get install -y libpcre3-dev libevent-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG crystal_deb
COPY ${crystal_deb} /tmp/crystal.deb
# nightly packages do not have valid version numbers
RUN dpkg --force-bad-version -i /tmp/crystal.deb

CMD ["/bin/sh"]
