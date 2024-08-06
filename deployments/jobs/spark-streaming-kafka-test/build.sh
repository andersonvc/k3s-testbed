#!/bin/bash

IMAGE=registry.polyvaria.com/spark-streaming-kafka-job
VERSION=0.1

docker build -t $IMAGE:$VERSION .
docker push $IMAGE:$VERSION
#kubectl apply -f pv-pvc.yaml
kubectl delete -f job.yaml
kubectl apply -f job.yaml