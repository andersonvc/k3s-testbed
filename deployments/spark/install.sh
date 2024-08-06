#!/bin/bash

source ~/.secrets/k3s-setup-secrets

helm upgrade spark \
    --install \
    --create-namespace \
    --namespace core \
    --values spark_values.yaml \
    oci://registry-1.docker.io/bitnamicharts/spark

kubectl apply -f ingress.yaml