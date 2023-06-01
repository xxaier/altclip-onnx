#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

mkdir -p out

docker run \
  -v $DIR/misc:/app/misc \
  -v $DIR/img:/app/img \
  -v $DIR/export:/app/export \
  -v $DIR/out:/app/out \
  -it --rm altclip /bin/bash
