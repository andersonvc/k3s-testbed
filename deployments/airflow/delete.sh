kubectl delete -f secrets.yaml
kubectl delete -f ingress.yaml
helm --namespace core delete airflow --wait