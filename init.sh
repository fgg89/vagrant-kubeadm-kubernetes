#!/bin/bash

# Copy new kubeconfig
cp configs/config /home/fran/.kube

# Restart dns
kubectl -n kube-system rollout restart deployment coredns

# Restart dashboard
kubectl -n kubernetes-dashboard rollout restart deployment kubernetes-dashboard-web
kubectl -n kubernetes-dashboard rollout restart deployment kubernetes-dashboard-auth
kubectl -n kubernetes-dashboard rollout restart deployment kubernetes-dashboard-api
kubectl -n kubernetes-dashboard rollout restart deployment kubernetes-dashboard-kong
kubectl -n kubernetes-dashboard rollout restart deployment kubernetes-dashboard-metrics-scaper

# Dashboard proxy
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443 &

# Dashboard token
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d

