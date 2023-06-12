#!/bin/sh
[ -d /server/plugins ] && rm -f /server/plugins/*.jar

rsync --chown server:server --remove-source-files -rltd  /server_tomerge/ /server/
chown -R server:server /server

su-exec server:server /server/start.sh