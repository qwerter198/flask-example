#!/bin/bash

cd /temp/flask-example

kubectl apply -f kubernetes/deployment.yaml

kubectl apply -f kubernetes/service.yaml

echo "Application deployed successfully!"