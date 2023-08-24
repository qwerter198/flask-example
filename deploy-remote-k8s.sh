#!/bin/bash

cd /temp/flask-example

git checkout main

git pull

docker-compose -f docker-compose.yml down

docker-compose -f docker-compose.yml up -d

docker-compose push

sleep 10

gcloud version
kubectl version

gcloud auth activate-service-account --key-file=/tmp/gcp_key.json

# gcloud container clusters get-credentials $CLUSTER_NAME --zone $CLUSTER_ZONE --project $PROJECT_ID
gcloud container clusters get-credentials kuar-cluster --zone us-west1-a --project woven-fountain-394919

kubectl apply -f kubernetes/deployment.yaml

kubectl apply -f kubernetes/service.yaml

docker rmi zxcv198/flask-example:1.0.3

echo "Application deployed successfully!"