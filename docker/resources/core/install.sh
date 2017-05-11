#!/bin/sh -e

apt-get update
apt-get -y install $@
rm -rf /var/lib/apt/lists/*
