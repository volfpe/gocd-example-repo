#! /bin/bash

kubectl get pods
echo "HELLO"
cat /root/.kube/config
kubectl apply -f serverpod.yml