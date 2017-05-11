#!/bin/sh -e

cd /opt/wildfly
bin/standalone.sh --admin-only &
sleep 10
bin/jboss-cli.sh -c --file=$1
sleep 10
rm -rf standalone/configuration/standalone_xml_history
