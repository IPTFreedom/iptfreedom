#!/bin/sh
[ -d /server/plugins ] && rm -f /server/plugins/*.jar

rsync --chown server:server -rltd  /server_tomerge/ /server/
chown -R server:server /server

su-exec server:server /server/start.sh
