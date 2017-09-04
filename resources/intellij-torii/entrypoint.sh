#!/bin/sh

[ ! -d java-core ] && git clone https://github.com/mazerty/java-core
[ ! -d shika-kami ] && git clone https://github.com/mazerty/shika-kami
[ ! -d shika-ishi ] && git clone https://github.com/mazerty/shika-ishi
[ ! -d java-arquillian ] && git clone https://github.com/mazerty/java-arquillian
[ ! -d shika-torii ] && git clone https://github.com/mazerty/shika-torii && cd shika-torii && mvn flyway:migrate && mvn flyway:migrate -Pdatabase-test && mvn wildfly:deploy

exec /opt/intellij/bin/idea.sh
