#!/bin/bash

source ~/.secrets/k3s-setup-secrets

helm upgrade traefik \
    --install \
    --create-namespace \
    --namespace core \
    --values traefik-values.yaml \
    --set service.spec.loadBalancerIP=$TRAEFIK_PUBLIC_IP \
    --wait \
    traefik/traefik

export BASE64PASSWORD=$(htpasswd -nb admin $TRAEFIK_PASSWORD | openssl base64)
envsubst < middleware.yaml | kubectl apply -f -