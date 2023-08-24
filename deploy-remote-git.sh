#!/bin/bash

cd /temp/flask-example

git pull

docker-compose -f dokcer-compose.yml down

docker rmi flask-example_web:1.0.0

docker-compose -f docker-compose.yml up -d

echo "Application deployed successfully!"