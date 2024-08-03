#!/bin/bash

kubectl delete -n kafka secret polyvaria-wildcard-tls
kubectl delete -n kafka certificate polyvaria-wildcard-cert
kubectl delete -f kafka_cluster.yaml
kubectl delete -f ingress.yaml
helm --namespace kafka delete strimzi --wait
