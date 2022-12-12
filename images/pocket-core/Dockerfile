FROM poktnetwork/pocket-core:RC-0.9.2

USER root
RUN apk --no-cache add curl jq vim
RUN cp /usr/share/zoneinfo/Europe/Zurich  /etc/localtime
COPY entrypoint.sh /home/app/
USER app
