#!/bin/bash
set -e

build() {
  docker pull $1

  cat ${@:2} > Dockerfile
  docker build --cache-from $1 -t $1 .

  docker push $1
}

docker login

build mazerty/postgresql         core postgresql
build mazerty/wildfly-postgresql core jdk wildfly wildfly-postgresql
build mazerty/maven-torii        core jdk maven maven-torii
build mazerty/nginx              core nginx

build mazerty/awscli             core dev awscli

rm Dockerfile
