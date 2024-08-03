helm --namespace core delete metallb --wait
kubectl delete -f metallb-config.yaml