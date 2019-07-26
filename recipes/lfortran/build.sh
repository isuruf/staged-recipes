#!/bin/bash

set -ex

printenv

if [[ ${MACOSX_DEPLOYMENT_TARGET} != "" ]]; then
    # macOS
    python -m pip install . -vv \
      --global-option="build" \
      --global-option="--" \
      --global-option="-DCMAKE_OSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET}"
else
    # Linux
    python -m pip install . -vv
fi
