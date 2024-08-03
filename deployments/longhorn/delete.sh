kubectl delete -f ingress.yaml
kubectl delete -f service.yaml
helm --namespace core delete longhorn --wait