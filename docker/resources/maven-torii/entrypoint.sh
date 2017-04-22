#!/bin/sh
set -e

mvn-run.sh java-core       install
mvn-run.sh shika-kami      install
mvn-run.sh shika-ishi      install
mvn-run.sh java-arquillian install
mvn-run.sh shika-torii     flyway:migrate wildfly:deploy -Dmaven.test.skip=true
