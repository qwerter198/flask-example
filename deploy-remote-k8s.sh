#!/bin/bash

cd /temp/flask-example

git checkout main

git pull

docker-compose -f docker-compose.yml down

docker-compose -f docker-compose.yml up -d

docker-compose push

sleep 3

curl https://sdk.cloud.google.com | bash -s -- --disable-prompts > /dev/null
export PATH=${HOME}/google-cloud-sdk/bin:${PATH}

gcloud auth activate-service-account --key-file=/tmp/gcp_key.json
echo ${PROJECT_ID}
gcloud --quiet config set project ${PROJECT_ID}
gcloud --quiet config set container/cluster ${CLUSTER_NAME}
gcloud --quiet config set compute/zone ${CLUSTER_ZONE}
gcloud --quiet container clusters get-credentials ${CLUSTER_NAME}

kubectl apply -f kubernetes/deployment.yaml

kubectl apply -f kubernetes/service.yaml

docker rmi zxcv198/flask-example:1.0.6

echo "Application deployed successfully!"