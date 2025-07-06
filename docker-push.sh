#!/bin/bash
# Quick Docker tag and push script
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
USER=${1:-armaanlala}; IMG=${2:-microbin}; TAG=${3:-latest}
echo -e "${GREEN}🐳 Building and pushing ${USER}/${IMG}:${TAG}${NC}"
docker build -t "${USER}:${IMG}" . && echo -e "${GREEN}✅ Built${NC}" || { echo -e "${RED}❌ Build failed${NC}"; exit 1; }
docker tag "${USER}:${IMG}" "${USER}/${IMG}:${TAG}" && echo -e "${GREEN}✅ Tagged${NC}" || { echo -e "${RED}❌ Tag failed${NC}"; exit 1; }
docker login && docker push "${USER}/${IMG}:${TAG}" && echo -e "${GREEN}✅ Pushed to Docker Hub!${NC}" || { echo -e "${RED}❌ Push failed${NC}"; exit 1; }
echo -e "${YELLOW}📦 Image: ${USER}/${IMG}:${TAG}${NC}" 