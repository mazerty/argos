#!/bin/sh
set -e

apt-get update
apt-get -y install $@
rm -rf /var/lib/apt/lists/*
