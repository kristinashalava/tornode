FROM alpine:latest
RUN apk update && apk upgrade && \
    apk add tor curl && \
    rm /var/cache/apk/* && \
    cp /etc/tor/torrc.sample /etc/tor/torrc && \
    echo "SocksPort 0.0.0.0:9050" > /etc/tor/torrc
EXPOSE 9050
USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
