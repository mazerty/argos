#!/bin/sh

[ ! -d java-core ] && git clone https://github.com/mazerty/java-core
[ ! -d shika-kami ] && git clone https://github.com/mazerty/shika-kami
[ ! -d shika-ishi ] && git clone https://github.com/mazerty/shika-ishi
[ ! -d shika-shuryo ] && git clone https://github.com/mazerty/shika-shuryo && cd shika-shuryo && mvn wildfly:deploy

exec /opt/intellij/bin/idea.sh
