`kubectl apply -f rbac.yaml`
This is needed to grant permission for the in_cluster_launcher's pod to access cluster objects.

Load image to Kind cluster:

```
kind load docker-image ...
kubectl run <name> --image=<image name> --image_pull_policy=IfNotPresent
```

