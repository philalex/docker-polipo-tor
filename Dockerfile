FROM ubuntu:14.04
MAINTAINER Philippe ALEXANDRE <alexandre.philippe+github@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV ENV INITRD No
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN echo "deb http://deb.torproject.org/torproject.org trusty main" > /etc/apt/sources.list.d/torproject.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y polipo deb.torproject.org-keyring tor supervisor
RUN mkdir /var/run/tor
RUN chown -R debian-tor.debian-tor /var/run/tor
RUN chmod o-rx /var/run/tor 
RUN mkdir /var/run/polipo
RUN chown -R proxy.proxy /var/run/polipo
# Add configurations
ADD polipo.conf /etc/polipo/config
ADD supervisor_tor.conf /etc/supervisor/conf.d/tor.conf
ADD torrc /etc/tor/torrc

EXPOSE 8118
CMD ["/usr/bin/supervisord", "-n"]
