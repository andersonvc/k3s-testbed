#!/bin/bash

kubectl delete -f ingress.yaml
helm --namespace core delete docker-registry --wait