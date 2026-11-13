#!/bin/bash
cd "$(dirname "$0")" || exit 1

docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app node:16 sh -c "npm ci && npm run build"

tar -czvf yanbaevmm-frontend.tar.gz dist
