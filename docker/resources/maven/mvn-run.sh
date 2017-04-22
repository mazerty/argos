#!/bin/bash
set -e

[ -d $1 ] || git clone https://github.com/mazerty/$1.git
cd $1
[ -n $BRANCH ] && git checkout $BRANCH
mvn ${@:2}
cd ..
rm -rf $1
