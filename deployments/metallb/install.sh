helm upgrade metallb \
    --install \
    --namespace core \
    --wait \
    metallb/metallb
kubectl apply -f metallb-config.yaml