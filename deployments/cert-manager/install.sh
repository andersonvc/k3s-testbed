#!/bin/bash
source ~/.secrets/k3s-setup-secrets

helm upgrade cert-manager \
    --install \
    --create-namespace \
    --namespace core \
    --version v1.13.3 \
    --wait \
    --set 
    --set installCRDs=true \
    --set podDnsConfig.nameservers[0]="8.8.8.8" \
    --set podDnsConfig.nameservers[1]="1.1.1.1" \
    --set 'extraArgs={--dns01-recursive-nameservers-only=true,--dns01-recursive-nameservers=8.8.8.8:53\,1.1.1.1:53}' \
    --set 'clusterResourceNamespace=core' \
    jetstack/cert-manager

envsubst < aws-clusterissuer.yaml | kubectl apply -f -