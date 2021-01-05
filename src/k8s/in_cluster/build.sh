#!/bin/bash -e

# Kubelet does not repull the tag, even if the pull policy is "always",
# so we apply new tag for each newly-created image.
image_name="localhost:5000/k8s:zyx${RANDOM}"

# GOOS & GOARCH are needed on mac, as docker runs everything inside a Linux VM.
GOOS=linux GOARCH=amd64 go build .

docker build --tag="${image_name}" .
docker push "${image_name}"
kubectl delete all --all
kubectl run zyx --generator=run-pod/v1 --image="${image_name}"
