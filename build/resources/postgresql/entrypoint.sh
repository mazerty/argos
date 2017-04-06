#!/bin/bash
set -e

data=/volume/data
bin=/usr/lib/postgresql/9.5/bin

export IDEM_DIR=/volume/.idem
idem.sh "mkdir $data && chown postgres:postgres $data"
idem.sh "gosu postgres $bin/initdb --locale=C.UTF-8 -D $data"

exec gosu postgres $bin/postgres -D $data
