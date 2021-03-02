#! /bin/bash

kubectl get pods
helm upgrade --install --set image.tag=$BUILD_ID jetson-server ./helm/jetson-server