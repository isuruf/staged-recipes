#!/bin/bash

set -ex

printenv

python -m pip install . -vv --install-option="--plat-name macosx-10.9-x86_64"
