#!/bin/bash
set -ex

build() {
  # creates the Dockerfile from the various layers
  cat ${@:2} > Dockerfile

  # builds the image
  docker build -t $1 .

  # pushes the image into the registry
  docker push $1

  # cleans the dockerfile
  rm Dockerfile
}

# loads docker cache from s3
aws --region eu-central-1 s3 cp s3://mazerty-argos/cache.tar.gz - | gunzip | docker load

# logs into docker registry
docker login

# builds production images
build mazerty/postgresql         core postgresql
build mazerty/wildfly-postgresql core jdk wildfly wildfly-postgresql
build mazerty/maven-torii        core jdk maven maven-torii
build mazerty/nginx              core nginx

# builds development images
build mazerty/intellij-torii     core jdk wildfly wildfly-postgresql maven intellij intellij-torii

# saves docker cache into s3
docker image prune
docker save $(docker image ls -qa) | gzip > /tmp/cache.tar.gz
aws --region eu-central-1 s3 cp /tmp/cache.tar.gz s3://mazerty-argos/cache.tar.gz
