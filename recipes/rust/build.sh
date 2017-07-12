#!/bin/bash -e

./configure --disable-codegen-tests --prefix=$PREFIX --llvm-root=$PREFIX --jemalloc-root=$PREFIX/lib
make
make install
