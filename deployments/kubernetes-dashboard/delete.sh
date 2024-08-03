#kubectl delete -f ingress.yaml
kubectl delete -f sa_roles.yaml
helm --namespace core delete kubernetes-dashboard --wait --debug
