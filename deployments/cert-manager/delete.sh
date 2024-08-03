kubectl delete -f aws-clusterissuer.yaml
helm --namespace core delete cert-manager --wait
kubectl delete secret -n core polyvaria-wildcard-tls

kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.1/cert-manager.crds.yaml