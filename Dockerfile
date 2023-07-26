# Locking this to a specific Fedora version for now. New releases of Postgresql, and Fedora versions going out of
# support will drive this upgrade every 6-12 months.
FROM quay.io/fedora/fedora:36

RUN dnf -y update && \
    dnf -y install python3-pip git pcp telnet nmap bind-utils net-tools curl traceroute mtr tcpdump community-mysql postgresql rsync skopeo redis && \
    dnf clean all

RUN pip install awscli redis

ADD root /

ENV TERM=vt100

RUN chmod 777 /run.sh && chmod 777 /urldecode.sh

USER 997

ENTRYPOINT ["/run.sh"]
