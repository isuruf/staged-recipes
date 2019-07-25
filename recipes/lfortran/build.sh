#!/bin/bash

set -ex

printenv

python -m pip install . -vv \
  --install-option="bdist_wheel" \
  --install-option="--plat-name" \
  --install-option="macosx-10.9-x86_64"
