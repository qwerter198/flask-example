#!/bin/bash

cd /temp/flask-example

git checkout main

git pull

docker-compose -f docker-compose.yml down

docker rmi flask-example_web:1.0.0

docker-compose -f docker-compose.yml up -d

echo "Application deployed successfully!"