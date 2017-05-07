#!/bin/sh
set -e

idem.sh "mvn-build.sh java-core       install" /workspace/.idem
idem.sh "mvn-build.sh shika-kami      install" /workspace/.idem
idem.sh "mvn-build.sh shika-ishi      install" /workspace/.idem
idem.sh "mvn-build.sh java-arquillian install" /workspace/.idem
idem.sh "mvn-build.sh shika-torii     flyway:migrate" /workspace/.idem
idem.sh "mvn-build.sh shika-torii     flyway:migrate -Pdatabase-test" /workspace/.idem
idem.sh "mvn-build.sh shika-torii     wildfly:deploy" /workspace/.idem

exec /opt/intellij/bin/idea.sh
