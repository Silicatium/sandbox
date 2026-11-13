#!/bin/bash
cd "$(dirname "$0")" || exit 1
docker network create sandbox-net-sh
docker build . -t sandbox-backend-sh
docker run -d --network sandbox-net-sh --name sandbox-backend-container sandbox-backend-sh:latest 