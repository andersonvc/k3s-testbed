#!/bin/bash
CONTAINER_NAME=spark-base
VERSION=0.6
docker build -t registry.polyvaria.com/$CONTAINER_NAME:$VERSION .
docker push registry.polyvaria.com/$CONTAINER_NAME:$VERSION
