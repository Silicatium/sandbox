#!/bin/bash
cd "$(dirname "$0")" || exit 1

docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e CGO_ENABLED=0 -e GOOS=linux golang:alpine go build -ldflags="-w -s" -o app ./cmd/api

tar -czvf yanbaevmm-backend.tar.gz app
