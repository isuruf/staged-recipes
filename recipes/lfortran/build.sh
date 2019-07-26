#!/bin/bash

set -ex

printenv

if [[ ${MACOSX_DEPLOYMENT_TARGET} != "" ]]; then
    # macOS
    python -m pip install . -vv \
      --install-option="bdist_wheel" \
      --install-option="--plat-name" \
      --install-option="macosx-10.9-x86_64"
else
    # Linux
    python -m pip install . -vv
fi
