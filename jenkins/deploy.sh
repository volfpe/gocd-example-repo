#! /bin/bash

kubectl get pods
helm upgrade --install --atomic --timeout 15m0s --set image.tag=$BUILD_ID jetson-server ./helm/jetson-server