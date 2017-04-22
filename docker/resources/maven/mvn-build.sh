#!/bin/bash
set -e

[ -d $1 ] || git clone git@github.com:mazerty/$1.git
cd $1
[ -n $BRANCH ] && git checkout $BRANCH
mvn ${@:2}
