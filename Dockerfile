FROM centos:centos7
MAINTAINER Paul Bergene <pbergene@redhat.com>

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/postgresql10-10.13-1PGDG.rhel7.x86_64.rpm \
    yum -y update && \
    yum -y install git pcp telnet nmap python python-pip bind-utils net-tools curl traceroute mtr tcpdump mysql && \
    yum -y install postgresql10 && \
    yum clean all

RUN pip install awscli

ADD root /

ENV TERM=vt100

RUN chmod 777 /run.sh

USER 997
ENTRYPOINT ["/run.sh"]
