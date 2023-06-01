#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

cmd="export/onnx.sh"

if ! [ -z $1 ]; then
  cmd="$cmd && $@"
fi

./bash.sh export MODEL=AltCLIP-XLMR-L && $cmd
./bash.sh export MODEL=AltCLIP-XLMR-L-m9 && $cmd
./bash.sh $cmd
