## Restart dns
--------------

```
kubectl -n kube-system rollout restart deployment coredns
```

## Troubleshoot
---------------

```
kubectl get nodes -v=10
```

## Dashboard port-forward
-------------------------

```
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
```

## Dashboard token
------------------

```
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d
```

kubectl proxy --address 0.0.0.0 --accept-hosts '.*'

