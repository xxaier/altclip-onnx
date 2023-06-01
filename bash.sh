#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

docker run \
  -v $DIR/misc:/app/misc \
  -v $DIR/img:/app/img \
  -v $DIR/export:/app/export \
  -it --rm altclip /bin/bash
