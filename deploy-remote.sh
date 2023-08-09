#!/bin/bash

echo "cd /temp/flask-example"
cd /temp/flask-example

echo "git pull"
git pull

echo "docker-compose -f dokcer-compose.yml down"
docker-compose -f dokcer-compose.yml down

echo "docker rmi flask-example_web"
docker rmi flask-example_web

echo "docker-compose -f docker-compose.yml up -d"
docker-compose -f docker-compose.yml up -d

echo "Application deployed successfully!"