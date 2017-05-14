#!/bin/bash -ex

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

# logs into docker registry
docker login

# loads docker cache from s3
aws --region eu-central-1 s3 cp s3://mazerty-argos/cache.tar.gz - | gunzip | docker load

# builds production images
build mazerty/postgresql                  core postgresql
build mazerty/wildfly-postgresql          core jdk wildfly wildfly-postgresql
build mazerty/maven-torii                 core jdk maven maven-torii
build mazerty/nginx                       core nginx

# builds development images
build mazerty/intellij                    core jdk maven intellij
build mazerty/intellij-wildfly            core jdk maven intellij wildfly
build mazerty/intellij-wildfly-postgresql core jdk maven intellij wildfly wildfly-postgresql
build mazerty/intellij-torii              core jdk maven intellij wildfly wildfly-postgresql intellij-torii
build mazerty/intellij-shuryo             core jdk maven intellij wildfly intellij-shuryo

# saves docker cache into s3
docker image prune -f
docker save $(docker image ls -qa) | gzip > /tmp/cache.tar.gz
aws --region eu-central-1 s3 cp /tmp/cache.tar.gz s3://mazerty-argos/cache.tar.gz
