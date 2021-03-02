#! /bin/sh

ls -la
pwd
docker login $BUILD_DOCKER_HOST -u $BUILD_DOCKER_USER -p $BUILD_DOCKER_PASS
docker build -f $WORKSPACE/py-server/Dockerfile -t ${BUILD_DOCKER_HOST}/${BUILD_DOCKER_PROJECT}/server:${BUILD_ID} $WORKSPACE/py-server
docker push ${BUILD_DOCKER_HOST}/${BUILD_DOCKER_PROJECT}/server:${BUILD_ID}