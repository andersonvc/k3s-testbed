#!/bin/bash
CONTAINER_NAME=spark-streaming-job-base
VERSION=0.1
docker build -t registry.polyvaria.com/$CONTAINER_NAME:$VERSION .
docker push registry.polyvaria.com/$CONTAINER_NAME:$VERSION
