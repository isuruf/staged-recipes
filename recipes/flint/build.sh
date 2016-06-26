#!/usr/bin/env bash

source activate "${CONDA_DEFAULT_ENV}"

./configure --prefix=$PREFIX --with-gmp=$PREFIX --with-mpfr=$PREFIX
make
make install
make check