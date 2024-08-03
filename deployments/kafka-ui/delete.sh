#!/bin/bash

kubectl delete -f ingress.yaml
helm --namespace core delete confluent-schema-registry --wait
helm --namespace core delete kafka-ui --wait
