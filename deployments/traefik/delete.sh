kubectl delete -f traefik-dashboard.yaml
kubectl delete -f default-headers.yaml
kubectl delete -f middleware.yaml

helm --namespace core delete traefik --wait

kubectl get crds -oname | grep "traefik" | xargs kubectl delete
kubectl get -n core crd | grep 'traefik.containo.us' | awk '{ print $1 }' | xargs kubectl -n core delete crd