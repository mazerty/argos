#!/bin/bash
set -e

git clone https://github.com/$1/$2.git
cd $2
[ -n $BRANCH ] && git checkout $BRANCH
mvn ${@:3}
cd ..
rm -rf $2
