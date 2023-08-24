#!/bin/bash

cd /temp/flask-example

git checkout main

git pull

docker-compose -f docker-compose.yml down

docker-compose -f docker-compose.yml up -d

docker-compose push

sleep 10

kubectl apply -f kubernetes/deployment.yaml

kubectl apply -f kubernetes/service.yaml

docker rmi zxcv198/flask-example:1.0.2

echo "Application deployed successfully!"