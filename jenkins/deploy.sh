#! /bin/bash

kubectl get pods
helm install --upgrade --set image.tag=$BUILD_ID jetson-server ./helm/jetson-server