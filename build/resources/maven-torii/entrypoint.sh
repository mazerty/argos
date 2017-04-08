#!/bin/sh
set -e

gitclonemvn.sh mazerty java-core install
gitclonemvn.sh mazerty shika-kami install
gitclonemvn.sh mazerty shika-ishi install
gitclonemvn.sh mazerty java-arquillian install
gitclonemvn.sh mazerty shika-torii flyway:migrate wildfly:deploy -Dmaven.test.skip=true
