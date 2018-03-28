FROM centos:centos7
MAINTAINER Paul Bergene <pbergene@redhat.com>

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y install nmap
    yum clean all 

ADD root /

RUN chmod 777 /run.sh

USER 997
ENTRYPOINT ["/run.sh"]
