#!/bin/sh
set -e

export IDEM_DIR=/workspace/.idem
idem.sh "mvn-build.sh java-core       install"
idem.sh "mvn-build.sh shika-kami      install"
idem.sh "mvn-build.sh shika-ishi      install"
idem.sh "mvn-build.sh java-arquillian install"
idem.sh "mvn-build.sh shika-torii     flyway:migrate"
idem.sh "mvn-build.sh shika-torii     flyway:migrate -Pdatabase-test"
idem.sh "mvn-build.sh shika-torii     wildfly:deploy"

exec /opt/intellij/bin/idea.sh
