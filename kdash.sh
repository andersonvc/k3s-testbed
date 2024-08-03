#!/bin/bash
kubectl -n core create token admin-user | pbcopy && kubectl -n core port-forward svc/kubernetes-dashboard-kong-proxy 8443:443