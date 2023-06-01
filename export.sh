#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

./bash.sh MODEL=AltCLIP-XLMR-L export/onnx.sh
./bash.sh MODEL=AltCLIP-XLMR-L-m9 export/onnx.sh
./bash.sh export/onnx.sh
