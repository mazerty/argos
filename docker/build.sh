#!/bin/bash
set -e

build() {
  cat ${@:2} > Dockerfile
  docker build -t $1 .

  docker push $1
}

docker login
aws --region eu-central-1 s3 cp s3://mazerty-argos/cache.tar.gz - | gunzip | docker load

build mazerty/postgresql         core postgresql
build mazerty/wildfly-postgresql core jdk wildfly wildfly-postgresql
build mazerty/maven-torii        core jdk maven maven-torii
build mazerty/nginx              core nginx

build mazerty/intellij-torii     core jdk wildfly wildfly-postgresql maven intellij intellij-torii

docker save $(docker image ls -qa) | gzip | aws --region eu-central-1 s3 cp - s3://mazerty-argos/cache.tar.gz
rm Dockerfile
