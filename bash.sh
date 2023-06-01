#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

mkdir -p out
mkdir -p model

docker run \
  -v $DIR/misc:/app/misc \
  -v $DIR/img:/app/img \
  -v $DIR/export:/app/export \
  -v $DIR/onnx:/app/onnx \
  -v $DIR/model:/app/model \
  -v $DIR/test:/app/test \
  -it --rm altclip-onnx ${@-/bin/bash}
