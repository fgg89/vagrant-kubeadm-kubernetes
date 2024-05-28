Links
-----

https://github.com/fgg89/vagrant-kubeadm-kubernetes/tree/fran
https://devopscube.com/kubernetes-cluster-vagrant/

init.sh

ssh -L 8443:localhost:8443 piernik (ssh tunnel for dashboard access from localhost)

1. vagrant up 
2. cp configs/config ~/.kube
3. restart dns
4. restart kubernetes dashboard deployments
5. get dashboard secret
6. kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443 (from server) 
7. https://localhost:8443 (from localhost)
