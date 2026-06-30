#!/bin/bash
set -e

echo "Updating backend..."
cd /opt/spring-lab/spring-backend-lab
git fetch origin main
git reset --hard origin/main

echo "Updating bff..."
cd /opt/spring-lab/bff
git fetch origin main
git reset --hard origin/main

echo "Rebuilding containers..."
docker compose -f docker-compose.prod.yml up -d --build

echo "Pruning old images..."
docker image prune -f

echo "Deploy completed."