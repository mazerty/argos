#!/bin/sh -e

git clone https://github.com/mazerty/shika-torii.git
cd shika-torii/
mvn flyway:migrate wildfly:deploy -Dmaven.test.skip=true
