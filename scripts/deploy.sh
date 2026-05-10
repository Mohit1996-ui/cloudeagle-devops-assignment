#!/bin/bash

ENVIRONMENT=$1

echo "Starting deployment to $ENVIRONMENT environment"

kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl apply -f kubernetes/ingress.yaml

echo "Deployment completed for $ENVIRONMENT"
