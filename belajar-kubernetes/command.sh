# kubectl create -f <config-file.yaml>
kubectl create -f pod.yaml

kubectl get pod
kubectl delete pod <pod-name>

# not for production
kubectl port-forward <pod-name> <host-port>:<pod-port>

kubectl describe pod <pod-name>

kubectl get pod --namespace <space-name>

# switch main namespace
kubectl config set-context --current --namespace=day2-space

# delete namespace
# WARNING! pod will be deleted
kubectl delete namespace <space-naem>

# delete all pod in namespace
kubectl delete pod --all --namespace <space-name>
