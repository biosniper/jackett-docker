FROM alpine:latest

WORKDIR /opt

# install dependencies and install mono
RUN apk add --update wget tar bzip2 curl-dev && apk add mono --update-cache --repository http://nl.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && rm -Rfv /var/cache/apk/*

# create group and user
RUN addgroup -S jackett && adduser -s /bin/false -h /usr/share/Jackett -G jackett -S jackett && mkdir -p /usr/share/Jackett && chown -R jackett: /usr/share/Jackett

# wget Jackett decompress then cleanup
RUN wget --no-check-certificate -q https://github.com/Jackett/Jackett/releases/download/v0.7.110/Jackett.Binaries.Mono.tar.gz && tar -zxf Jackett.Binaries.Mono.tar.gz && rm -v /opt/Jackett.Binaries.Mono.tar.gz

#set the owner
RUN chown -R jackett: /opt/Jackett

# map /config to host defined config path (used to store configuration from supervisor)
VOLUME /config

# map /opt/Jackett/.config/Jackett to host defined config path (used to store configuration from Jackett)
VOLUME /opt/Jackett/.config/Jackett

# expose port for http
EXPOSE 9117

# run
ENTRYPOINT ["/usr/bin/mono", "--debug", "/opt/Jackett/JackettConsole.exe"]
CMD ["-x", "true"]

