#!/bin/bash

set -ex

printenv

if [[ ${MACOSX_DEPLOYMENT_TARGET} != "" ]]; then
    # macOS
    python -m pip install . -vv
else
    # Linux
    python -m pip install . -vv
fi
