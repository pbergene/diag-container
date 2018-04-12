FROM centos:centos7
MAINTAINER Paul Bergene <pbergene@redhat.com>

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y update && \
    yum -y install telnet nmap bind-utils net-tools curl traceroute mtr tcpdump && \
    yum -y install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm \
    yum clean all

ADD root /

ENV TERM=vt100

RUN chmod 777 /run.sh

USER 997
ENTRYPOINT ["/run.sh"]
