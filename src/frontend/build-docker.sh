#!/bin/bash
cd "$(dirname "$0")" || exit 1
docker build . -t sandbox-frontend-sh
docker run -d --network sandbox-net-sh --name sandbox-frontend-sh -p 1234:8888 sandbox-frontend-sh:latest 