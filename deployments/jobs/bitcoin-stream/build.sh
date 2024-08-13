#!/bin/bash

kubectl delete -f job.yaml
kubectl delete -f configmap.yaml
kubectl apply -f configmap.yaml
kubectl apply -f job.yaml