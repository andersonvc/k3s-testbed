#!/bin/bash

source ~/.secrets/k3s-setup-secrets

helm upgrade kafka-ui \
    --install \
    --create-namespace \
    --namespace core \
    --values kafka_ui_values.yaml \
    kafka-ui/kafka-ui

helm upgrade confluent-schema-registry \
  --install \
  --create-namespace \
  --namespace core \
  --values=registry_values.yaml \
  oci://registry-1.docker.io/bitnamicharts/schema-registry

kubectl apply -f ingress.yaml