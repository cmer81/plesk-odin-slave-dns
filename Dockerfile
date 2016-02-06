FROM debian:latest
MAINTAINER Cedric Mercier <cmer@cmer.fr>

RUN apt-get update && apt-get install bind9 -y

ENV DNS_IP_MASTER 127.0.0.1
ENV RNDC_KEY xxxxx

RUN echo 'include "/etc/bind/rndc.key";' >> /etc/bind/named.conf
RUN sed -i "3 a\        allow-new-zones yes;" /etc/bind/named.conf.options

ADD scripts/config.sh /opt/config.sh
RUN chmod +x /opt/config.sh


ADD scripts/dns-start /sbin/dns-start
RUN chmod +x /sbin/dns-start

# Exposing DNS ports
EXPOSE 53/udp
EXPOSE 53
EXPOSE 953

CMD ["/sbin/dns-start"]
