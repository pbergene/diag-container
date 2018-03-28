FROM centos:centos7
MAINTAINER Paul Bergene <pbergene@redhat.com>

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y update && \
    yum -y install postgresql telnet nmap bind-utils net-tools curl traceroute mtr tcpdump && \
    yum clean all

ADD root /

ENV TERM=vt100

RUN chmod 777 /run.sh

USER 997
ENTRYPOINT ["/run.sh"]
