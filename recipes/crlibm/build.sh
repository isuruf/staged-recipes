#!/usr/bin/env bash

cd src
./prepare
./configure --prefix=$PREFIX
make -j${CPU_COUNT}
make check
make install
