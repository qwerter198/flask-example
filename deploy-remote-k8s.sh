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

gcloud version

kubectl version

gcloud components list | grep gke-gcloud-auth-plugin

gcloud auth activate-service-account --key-file=/tmp/gcp_key.json
gcloud --quiet config set project ${PROJECT_ID}
gcloud --quiet config set container/cluster ${CLUSTER_NAME}
gcloud --quiet config set compute/zone ${CLUSTER_ZONE}
gcloud --quiet container clusters get-credentials ${CLUSTER_NAME}

# gcloud --quiet config set project woven-fountain-394919
# gcloud --quiet config set container/cluster kuar-cluster
# gcloud --quiet config set compute/zone us-west1-a
# gcloud --quiet container clusters get-credentials kuar-cluster


# # gcloud container clusters get-credentials $CLUSTER_NAME --zone $CLUSTER_ZONE --project $PROJECT_ID
# gcloud container clusters get-credentials kuar-cluster --zone us-west1-a --project woven-fountain-394919

kubectl apply -f kubernetes/deployment.yaml

kubectl apply -f kubernetes/service.yaml

docker rmi zxcv198/flask-example:1.0.6

echo "Application deployed successfully!"