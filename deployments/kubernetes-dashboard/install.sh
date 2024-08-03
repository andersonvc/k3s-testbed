

helm upgrade kubernetes-dashboard \
    --install \
    --namespace core \
    --set=nginx.enabled=false \
    --set=cert-manager.enabled=false \
    --set=app.ingress.enabled=false \
    --wait \
    kubernetes-dashboard/kubernetes-dashboard  

kubectl apply -f sa_roles.yaml