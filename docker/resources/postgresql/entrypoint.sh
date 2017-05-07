#!/bin/bash
set -e

data=/volume/data
bin=/usr/lib/postgresql/9.5/bin

idem.sh "mkdir $data && chown postgres:postgres $data" /volume/.idem
idem.sh "gosu postgres $bin/initdb --locale=C.UTF-8 -D $data" /volume/.idem

exec gosu postgres $bin/postgres -D $data
