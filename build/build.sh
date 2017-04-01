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
build mazerty/deploy-torii       core jdk maven-git deploy-torii
build mazerty/nginx              core nginx

build mazerty/awscli             core dev awscli

rm Dockerfile
