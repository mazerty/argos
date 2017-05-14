#!/bin/sh -e

while true
do
  echo "[$0] waits 85 days"
  sleep 85d
  echo "[$0] done waiting, recreates the ssl certificate"
  certificate.sh
  echo "[$0] done recreating, restarts nginx"
  supervisorctl -c /etc/supervisor.conf restart nginx
done
