#!/bin/sh
set -e

openssl req \
    -new \
    -newkey rsa:4096 \
    -days 90 \
    -nodes \
    -x509 \
    -subj "/C=FR/CN=mazerty.fr" \
    -keyout /etc/ssl/private/key.pem \
    -out /etc/ssl/certs/crt.pem
