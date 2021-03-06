FROM debian:10

RUN apt-get update \
  && apt-get --no-install-recommends install -y clamav-daemon clamav-freshclam \
  && rm -rf /var/lib/apt/lists/*

ADD clamd.conf /etc/clamav/

RUN freshclam 

EXPOSE 3310/tcp

ENTRYPOINT ["/usr/sbin/clamd" ]

CMD [ "--foreground=true" ]
