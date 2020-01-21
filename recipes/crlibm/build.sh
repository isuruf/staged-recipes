#!/usr/bin/env bash

cd src
./prepare
./configure --prefix=$PREFIX

if [[ "$target_platform" == win* ]]; then
  make -j${CPU_COUNT} AR=$AR SUBDIRS="scs_lib ."
else
  make -j${CPU_COUNT} AR=$AR
  make check
fi
make install
