#!/bin/sh -e

mvn-build.sh java-core       clean install
mvn-build.sh shika-kami      clean install
mvn-build.sh shika-ishi      clean install
mvn-build.sh java-arquillian clean install
mvn-build.sh shika-torii     flyway:migrate
mvn-build.sh shika-torii     flyway:migrate -Pdatabase-test
mvn-build.sh shika-torii     clean wildfly:deploy
