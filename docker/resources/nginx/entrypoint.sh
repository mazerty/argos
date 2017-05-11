#!/bin/sh -e

certificate.sh
exec supervisord -c /etc/supervisor.conf
