#!/bin/bash

source ~/.secrets/k3s-setup-secrets

helm upgrade docker-registry \
    --install \
    --create-namespace \
    --namespace core \
    --values registry-values.yaml \
    --timeout 360s \
    --debug \
    --wait \
    twuni/docker-registry

kubectl apply -f ingress.yaml
