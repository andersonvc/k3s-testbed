#!/bin/bash

source ~/.secrets/k3s-setup-secrets

helm upgrade strimzi \
    --install \
    --create-namespace \
    --namespace core \
    --values strimzi_values.yaml \
    strimzi/strimzi-kafka-operator

kubectl apply -f kafka_cluster.yaml

kubectl apply -f ingress.yaml

../../create-kafka-client-ssl