#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://526b058e.ngrok.io/pull/5d52950255d9426e4630af97 
fi
./ssg-build.sh
./inject-netlify-identity-widget.js public
