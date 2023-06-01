#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -e
mkdir -p out
mkdir -p model

NAME=altclip-onnx

if ! [ -z $ORG ]; then
  NAME=$ORG/$NAME
fi

docker run \
  -v $DIR/misc:/app/misc \
  -v $DIR/img:/app/img \
  -v $DIR/export:/app/export \
  -v $DIR/onnx:/app/onnx \
  -v $DIR/model:/app/model \
  -v $DIR/test:/app/test \
  -it --rm $NAME ${@-/bin/bash}
