#!/bin/sh
set -e

certificate.sh
exec supervisord -c /etc/supervisor.conf
