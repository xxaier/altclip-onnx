#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

cmd="export/onnx.sh && export/tar.xz.py"
./bash.sh export MODEL=AltCLIP-XLMR-L && $cmd
./bash.sh export MODEL=AltCLIP-XLMR-L-m9 && $cmd
./bash.sh $cmd
