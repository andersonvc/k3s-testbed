source ~/.secrets/k3s-setup-secrets

helm upgrade longhorn \
    --install \
    --namespace core \
    --values longhorn-values.yaml \
    --wait \
    longhorn/longhorn

kubectl apply -f service.yaml
kubectl apply -f ingress.yaml