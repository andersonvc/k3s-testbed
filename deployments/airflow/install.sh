#!/bin/bash

source ~/.secrets/k3s-setup-secrets

kubectl get replicaset -n core | awk '/airflow-webserver/{print $1}' | xargs kubectl delete -n core replicaset
kubectl get svc -n core | awk '/airflow-webserver/{print $1}' | xargs kubectl delete -n core svc
kubectl get deployment -n core | awk '/airflow-webserver/{print $1}' | xargs kubectl delete -n core deployment

envsubst < secrets.yaml | kubectl apply -f -

helm upgrade airflow \
    --install \
    --create-namespace \
    --namespace core \
    --values airflow_values.yaml \
    --set webserver.defaultUser.password=$AIRFLOW_PASSWORD \
    --set webserverSecretKey=$AIRFLOW_WEBSERVER_SECRET_KEY \
    --set dags.gitSync.knownHosts="$AIRFLOW_GITSYNC_HOST" \
    --debug \
    apache-airflow/airflow

kubectl apply -f ingress.yaml