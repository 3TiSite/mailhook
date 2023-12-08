#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

bun x @3-/mdt .
cargo v patch -y
git add -u
git commit -mdist
cargo publish --registry crates-io
