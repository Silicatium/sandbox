#!/bin/bash
cd "$(dirname "$0")"
source .env

curl -u "${NEXUS_REPO_USER}:${NEXUS_REPO_PASS}" --upload-file backend/yanbaevmm-backend.tar.gz ${NEXUS_REPO_URL}/repository/${NEXUS_REPO_BACKEND_NAME}/${VERSION}/sandbox-backend-${VERSION}.tar.gz
curl -u "${NEXUS_REPO_USER}:${NEXUS_REPO_PASS}" --upload-file frontend/yanbaevmm-frontend.tar.gz ${NEXUS_REPO_URL}/repository/${NEXUS_REPO_FRONTEND_NAME}/${VERSION}/sandbox-frontend-${VERSION}.tar.gz