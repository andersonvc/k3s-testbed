#!/bin/bash

kubectl delete -f ingress.yaml
kubectl delete -f deployment.yaml
helm uninstall spark --namespace spark
