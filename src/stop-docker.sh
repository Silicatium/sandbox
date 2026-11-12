#!/bin/bash
docker stop sandbox-frontend-sh
docker stop sandbox-backend-container

docker rm sandbox-frontend-sh
docker rm sandbox-backend-container