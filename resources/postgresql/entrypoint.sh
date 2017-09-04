#!/bin/sh -e

data=/volume/data
bin=/usr/lib/postgresql/9.5/bin

[ ! -d $data ] && mkdir $data && chown postgres:postgres $data && gosu postgres $bin/initdb --locale=C.UTF-8 -D $data

exec gosu postgres $bin/postgres -D $data
