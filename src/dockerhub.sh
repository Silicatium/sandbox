#!/bin/bash
cd "$(dirname "$0")"

docker tag sandbox-frontend:latest silicatium/sandbox-frontend:latest
docker tag sandbox-backend:latest silicatium/sandbox-backend:latest

docker push silicatium/sandbox-frontend:latest
docker push silicatium/sandbox-backend:latest