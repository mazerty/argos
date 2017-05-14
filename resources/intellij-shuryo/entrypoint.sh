#!/bin/sh -e

idem.sh "mvn-build.sh java-core    install" /workspace/.idem
idem.sh "mvn-build.sh shika-kami   install" /workspace/.idem
idem.sh "mvn-build.sh shika-ishi   install" /workspace/.idem
idem.sh "mvn-build.sh shika-shuryo wildfly:deploy" /workspace/.idem

exec /opt/intellij/bin/idea.sh
