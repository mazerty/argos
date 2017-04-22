#!/bin/bash
set -e

build() {
  cat ${@:2} > Dockerfile
  docker build -t $1 .

  docker push $1
}

docker login

build mazerty/postgresql         core postgresql
build mazerty/wildfly-postgresql core jdk wildfly wildfly-postgresql
build mazerty/maven-torii        core jdk maven maven-torii
build mazerty/nginx              core nginx

build mazerty/awscli             core dev awscli
build mazerty/intellij-torii     core jdk wildfly wildfly-postgresql maven intellij intellij-torii

rm Dockerfile
