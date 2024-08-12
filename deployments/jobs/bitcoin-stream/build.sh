#!/bin/bash

kubectl delete -f job.yaml
kubectl apply -f configmap.yaml
kubectl apply -f job.yaml