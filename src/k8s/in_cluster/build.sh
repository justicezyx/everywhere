#!/bin/bash

image_name="localhost:5000/k8s:zyx"

# GOOS & GOARCH are needed on mac, as docker runs everything inside a Linux VM.
GOOS=linux GOARCH=amd64 go build .

docker build --tag="${image_name}" .
docker push "${image_name}"
kubectl delete all --all
kubectl run zyx --generator=run-pod/v1 --image="${image_name}"
