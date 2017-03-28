#!/bin/bash
set -e

build() {
  cat ${@:2} > Dockerfile
  docker build -t $1 .
}

build mazerty/postgresql core postgresql

rm Dockerfile
