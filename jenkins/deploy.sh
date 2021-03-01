#! /bin/bash

docker login $BUILD_DOCKER_HOST -u $BUILD_DOCKER_USER -p $BUILD_DOCKER_PASS
kubectl get pods
kubectl apply -f ../serverpod.yml