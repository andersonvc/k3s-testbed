#!/bin/bash
CONTAINER_NAME=alpaca-crypto-client
VERSION=0.0.1

poetry update && poetry build
docker build --network=host -t registry.polyvaria.com/$CONTAINER_NAME:$VERSION .
docker push registry.polyvaria.com/$CONTAINER_NAME:$VERSION