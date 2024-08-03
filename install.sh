#!/bin/bash

source ~/.secrets/k3s-setup-secrets

helm repo add metallb https://metallb.github.io/metallb
helm repo add traefik https://helm.traefik.io/traefik
helm repo add jetstack https://charts.jetstack.io
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo add longhorn https://charts.longhorn.io
helm repo add twuni https://helm.twun.io
helm repo add apache-airflow https://airflow.apache.org
helm repo add strimzi https://strimzi.io/charts/
helm repo add kafka-ui https://provectus.github.io/kafka-ui-charts

helm repo update

cd deployments/initial-setup && ./install.sh && cd ../..

cd deployments/metallb && ./install.sh && cd ../..

# cd deployments/cert-manager && ./install.sh && cd ../..

cd deployments/traefik && ./install.sh && cd ../..

cd deployments/kubernetes-dashboard && ./install.sh && cd ../..

cd deployments/longhorn && ./install.sh && cd ../..

cd deployments/docker-registry && ./install.sh && cd ../..

cd deployments/airflow && ./install.sh && cd ../..

cd deployments/kafka && ./install.sh && cd ../..

cd deployments/kafka-ui && ./install.sh && cd ../..