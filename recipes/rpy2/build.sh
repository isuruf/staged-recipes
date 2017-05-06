#!/bin/bash

# https://github.com/conda-forge/toolchain-feedstock/pull/11
export CFLAGS="-I${PREFIX}/include -I{PREFIX}/R/include ${CFLAGS}"
python setup.py install --single-version-externally-managed --record=record.txt
