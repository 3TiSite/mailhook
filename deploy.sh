#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

pkg=cargo-shuttle
if ! command -v $pkg &>/dev/null; then
  cargo install $pkg
fi

cargo shuttle deploy
