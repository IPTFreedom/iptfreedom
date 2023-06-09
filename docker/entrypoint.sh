#!/bin/sh
chown -R server:server /server

su-exec server:server /server/start.sh