#!/bin/sh -e

mvn-build.sh java-core    clean install
mvn-build.sh shika-kami   clean install
mvn-build.sh shika-ishi   clean install
mvn-build.sh shika-shuryo clean wildfly:deploy
