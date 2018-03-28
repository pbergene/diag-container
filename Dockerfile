FROM centos:centos7
MAINTAINER Paul Bergene <pbergene@redhat.com>

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum update && \
    yum -y install nmap bind-utils net-tools curl traceroute mtr tcpdump && \
    yum clean all

ADD root /

RUN chmod 777 /run.sh

USER 997
ENTRYPOINT ["/bin/bash"]
