#!/bin/bash -e

idem.py run docker/postgresql

exec gosu postgres /usr/lib/postgresql/9.5/bin/postgres -D /volume/data
